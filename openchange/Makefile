# Variables for Makefile dev environment
MYSQL_HOST=$(DB_PORT_3306_TCP_ADDR)
RESTSERVER_HOST=$(RESTSERVER_PORT_5001_TCP_ADDR)
OPENCHANGE_SRC=/openchange

.PHONY: openchange restserver run

openchange: install provision run

restserver: install
	echo HOST=\"0.0.0.0\" > /restserver.cfg
	API_SERVER_SETTINGS=/restserver.cfg python /openchange/python/mock/rest/api_server.py

provision:
	set -x -e
	sed -i -e s/MYSQL_HOST/$(MYSQL_HOST)/g -e s/MYSQL_PASSWORD/$(MYSQL_ROOT_PASSWORD)/g /etc/samba/smb.conf
	/usr/bin/samba-tool domain provision --realm=zentyal.lan \
	                                     --domain=zentyal \
	                                     --adminpass='foobar1!' \
	                                     --use-ntvfs --use-rfc2307 && \
	/usr/sbin/openchange_provision --standalone
	/usr/sbin/openchange_provision --openchangedb \
	                               --openchangedb-uri="mysql://root:$(MYSQL_ROOT_PASSWORD)@$(MYSQL_HOST)/openchange"
	/usr/bin/samba-tool domain passwordsettings set --complexity=off \
	                                                --min-pwd-length=0 \
	                                                --min-pwd-age=0 \
	                                                --max-pwd-age=365
	/usr/bin/samba-tool user create openchange openchange
	/usr/sbin/openchange_newuser --enable --create openchange
	cat /openchange_provision.sql | mysql -h $(MYSQL_HOST) -u root -p$(MYSQL_ROOT_PASSWORD) openchange
	/usr/lib/python2.7/dist-packages/openchange/backends/rest.py --provision --username=openchange

.openchange-autogen:
	cd /openchange && \
	./autogen.sh && CFLAGS='-g -O0' LDFLAGS=-Wl,--as-needed ./configure  --prefix=/usr --mandir=/usr/share/man --enable-pyopenchange --with-modulesdir=/usr/lib/x86_64-linux-gnu/openchange --libdir=/usr/lib/x86_64-linux-gnu; sed -i -e 's/site-packages/dist-packages/' config.mk
	@touch $@


install: .openchange-autogen
	cd /openchange && \
	make datadir=/usr/share/openchange LDFLAGS='-Wl,--as-needed' DSOOPT='-Wl,--as-needed -shared -fPIC' install pyopenchange-install && \
	ln -sf /openchange/mapiproxy/libmapistore/backends/python/rest.py /usr/lib/python2.7/dist-packages/openchange/backends/ && \
	echo [rest] > /usr/lib/python2.7/dist-packages/openchange/backends/config.ini && \
	echo base_url = http://$(RESTSERVER_HOST):5001 >> /usr/lib/python2.7/dist-packages/openchange/backends/config.ini

run:
	samba -i -d5

clean:
	rm .*autogen
	cd /openchange && make clean
