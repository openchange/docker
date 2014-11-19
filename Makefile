
MYSQL_ROOT_PASSWORD=foobar
OPENCHANGE_SRC=$(shell readlink -f ../openchange)

# openchange-provision exec needs mysql IP, TODO get int from env? DB_PORT_3306_TCP_ADDR!
MYSQL_HOST=$(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' oc-mysql || true)
RESTSERVER_HOST=$(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' oc-restserver || true)

mysql:
	docker run --name oc-mysql -e MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" -d mysql

restserver:
	docker run --name oc-restserver --rm=true \
               -v "$(OPENCHANGE_SRC):/openchange" \
               -i -t openchange

restserver-build-docker:
	docker build -t restserver restserver

restserver-autogen:
	docker exec -it oc-restserver /bin/sh -c " \
       cd /openchange && \
       ./autogen.sh && CFLAGS='-g -O0' LDFLAGS=-Wl,--as-needed ./configure  --prefix=/usr --mandir=/usr/share/man --enable-pyopenchange --with-modulesdir=/usr/lib/x86_64-linux-gnu/openchange --libdir=/usr/lib/x86_64-linux-gnu; sed -i -e 's/site-packages/dist-packages/' config.mk"

restserver-build:
	docker exec -it oc-restserver /bin/sh -c " \
       cd /openchange && \
       make datadir=/usr/share/openchange LDFLAGS='-Wl,--as-needed' DSOOPT='-Wl,--as-needed -shared -fPIC' install"

openchange:
	docker run --name oc-openchange \
               -e MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" \
               --link oc-mysql:db \
               --link oc-restserver:restserver \
               --rm=true \
               -v "$(OPENCHANGE_SRC):/openchange" \
               -i -t openchange

openchange-provision:
	docker exec -it oc-openchange /bin/sh -c -x " \
       sed -i -e s/MYSQL_HOST/$(MYSQL_HOST)/g -e s/MYSQL_PASSWORD/$(MYSQL_ROOT_PASSWORD)/g /etc/samba/smb.conf && \
       /usr/bin/samba-tool domain provision --realm=zentyal.lan \
                                            --domain=zentyal \
                                            --adminpass='foobar1!' \
                                            --use-ntvfs --use-rfc2307 && \
       /usr/sbin/openchange_provision --standalone && \
       /usr/sbin/openchange_provision --openchangedb \
                                      --openchangedb-uri=\"mysql://root:$(MYSQL_ROOT_PASSWORD)@$(MYSQL_HOST)/openchange\""

openchange-autogen:
	docker exec -it oc-openchange /bin/sh -c " \
       cd /openchange && \
       ./autogen.sh && CFLAGS='-g -O0' LDFLAGS=-Wl,--as-needed ./configure  --prefix=/usr --mandir=/usr/share/man --enable-pyopenchange --with-modulesdir=/usr/lib/x86_64-linux-gnu/openchange --libdir=/usr/lib/x86_64-linux-gnu; sed -i -e 's/site-packages/dist-packages/' config.mk"

openchange-build:
	docker exec -it oc-openchange /bin/sh -c -x " \
       cd /openchange && \
       make datadir=/usr/share/openchange LDFLAGS='-Wl,--as-needed' DSOOPT='-Wl,--as-needed -shared -fPIC' install && \
       ln -sf /openchange/mapiproxy/libmapistore/backends/python/rest.py /usr/lib/python2.7/dist-packages/openchange/backends/ && \
       echo [rest] > /usr/lib/python2.7/dist-packages/openchange/backends/config.ini && \
       echo base_url = http://$(RESTSERVER_HOST):5001 >> /usr/lib/python2.7/dist-packages/openchange/backends/config.ini"

.PHONY: mysql openchange restserver
