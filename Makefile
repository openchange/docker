# Variables for Makefile dev environment
MYSQL_ROOT_PASSWORD=foobar
OPENCHANGE_SRC=$(shell readlink -f ../openchange)

# openchange-provision exec needs mysql IP, TODO get int from env? DB_PORT_3306_TCP_ADDR!
MYSQL_HOST=$(shell sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' oc-mysql || true)
RESTSERVER_HOST=$(shell sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' oc-restserver || true)

.PHONY: mysql openchange restserver

mysql:
	sudo docker run --name oc-mysql --env MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" --detach mysql

restserver: .restserver-build-docker
	sudo docker run --name oc-restserver --rm=true \
               --volume "$(OPENCHANGE_SRC):/openchange" \
               --interactive --tty restserver

.restserver-build-docker:
	sudo docker build --tag restserver restserver
	@touch $@

.restserver-autogen:
	sudo docker exec -it oc-restserver /bin/sh -c " \
       cd /openchange && \
       ./autogen.sh && CFLAGS='-g -O0' LDFLAGS=-Wl,--as-needed ./configure  --prefix=/usr --mandir=/usr/share/man --enable-pyopenchange --with-modulesdir=/usr/lib/x86_64-linux-gnu/openchange --libdir=/usr/lib/x86_64-linux-gnu; sed -i -e 's/site-packages/dist-packages/' config.mk"
	@touch $@

restserver-build: .restserver-autogen
	sudo docker exec -it oc-restserver /bin/sh -c " \
       cd /openchange && \
       make datadir=/usr/share/openchange LDFLAGS='-Wl,--as-needed' DSOOPT='-Wl,--as-needed -shared -fPIC' install"


openchange: .openchange-build-docker
	sudo docker run --name oc-openchange \
               --env MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" \
               --link oc-mysql:db \
               --link oc-restserver:restserver \
               --rm=true \
               --volume "$(OPENCHANGE_SRC):/openchange" \
               --interactive --tty openchange

openchange-provision:
	sudo docker exec -it oc-openchange /bin/sh -c -x " \
       sed -i -e s/MYSQL_HOST/$(MYSQL_HOST)/g -e s/MYSQL_PASSWORD/$(MYSQL_ROOT_PASSWORD)/g /etc/samba/smb.conf && \
       /usr/bin/samba-tool domain provision --realm=zentyal.lan \
                                            --domain=zentyal \
                                            --adminpass='foobar1!' \
                                            --use-ntvfs --use-rfc2307 && \
       /usr/sbin/openchange_provision --standalone && \
       /usr/sbin/openchange_provision --openchangedb \
                                      --openchangedb-uri=\"mysql://root:$(MYSQL_ROOT_PASSWORD)@$(MYSQL_HOST)/openchange\" && \
       /usr/bin/samba-tool user create foobar foobar1! && \
       /usr/sbin/openchange_newuser --create --enable foobar"

.openchange-autogen:
	sudo docker exec -it oc-openchange /bin/sh -c " \
       cd /openchange && \
       ./autogen.sh && CFLAGS='-g -O0' LDFLAGS=-Wl,--as-needed ./configure  --prefix=/usr --mandir=/usr/share/man --enable-pyopenchange --with-modulesdir=/usr/lib/x86_64-linux-gnu/openchange --libdir=/usr/lib/x86_64-linux-gnu; sed -i -e 's/site-packages/dist-packages/' config.mk"
	@touch $@

openchange-build: .openchange-autogen
	sudo docker exec -it oc-openchange /bin/sh -c -x " \
       cd /openchange && \
       make datadir=/usr/share/openchange LDFLAGS='-Wl,--as-needed' DSOOPT='-Wl,--as-needed -shared -fPIC' install && \
       ln -sf /openchange/mapiproxy/libmapistore/backends/python/rest.py /usr/lib/python2.7/dist-packages/openchange/backends/ && \
       echo [rest] > /usr/lib/python2.7/dist-packages/openchange/backends/config.ini && \
       echo base_url = http://$(RESTSERVER_HOST):5001 >> /usr/lib/python2.7/dist-packages/openchange/backends/config.ini"

.openchange-build-docker:
	sudo docker build --tag openchange openchange
	@touch $@

clean:
	rm .*build-docker
	rm .*autogen
