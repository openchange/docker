# dev environment variables
OPENCHANGE_SRC=$(shell readlink -f ../openchange)
MYSQL_ROOT_PASSWORD=foobar

.PHONY: mysql openchange restserver

mysql:
	docker rm oc-mysql || true
	docker run --name oc-mysql --env MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" --detach mysql

restserver: build
	@docker rm oc-restserver || true
	docker run --name oc-restserver --rm=true \
               --volume "$(OPENCHANGE_SRC):/openchange" \
               --interactive --tty openchange \
               /bin/bash -c "make restserver; bash"

openchange: build
	@docker rm oc-openchange || true
	docker run --name oc-openchange \
               -e MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" \
               --link oc-mysql:db \
               --link oc-restserver:restserver \
               --rm=true \
               --volume "$(OPENCHANGE_SRC):/openchange" \
               --interactive --tty openchange \
               /bin/bash -c "make openchange; bash"

build:
	docker build --tag openchange $(NO_CACHE) openchange

build-force: NO_CACHE=--no-cache=true
build-force: build
