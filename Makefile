# dev environment variables
OPENCHANGE_SRC=$(shell readlink -f ../openchange)
MYSQL_ROOT_PASSWORD=foobar

.PHONY: mysql openchange restserver

mysql:
	docker rm oc-mysql || true
	docker run --name oc-mysql --env MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" --detach mysql

restserver:
	@docker rm oc-restserver || true
	docker build --tag openchange openchange
	docker run --name oc-restserver --rm=true \
               --volume "$(OPENCHANGE_SRC):/openchange" \
               --interactive --tty openchange

openchange:
	@docker rm oc-openchange || true
	docker build --tag openchange openchange
	docker run --name oc-openchange \
               -e MYSQL_ROOT_PASSWORD="$(MYSQL_ROOT_PASSWORD)" \
               --link oc-mysql:db \
               --link oc-restserver:restserver \
               --rm=true \
               --volume "$(OPENCHANGE_SRC):/openchange" \
               --interactive --tty openchange
