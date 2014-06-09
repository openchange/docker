#!/bin/bash

if [ -f /.mysql_admin_created ]; then
	echo "MySQL 'admin' user already created!"
	exit 0
fi

/usr/bin/mysqld_safe > /dev/null 2>&1 &

PASS=""
echo "=> Creating MySQL admin user with preset password"
RET=1
while [[ RET -ne 0 ]]; do
	sleep 5
	mysql -uroot -e "status" > /dev/null 2>&1
	RET=$?
done

mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"

mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

echo "=> Creating openchange database and user"
mysql -uroot -e "CREATE DATABASE openchange"
mysql -uroot -e "CREATE USER 'openchange'@'%' IDENTIFIED BY 'openchange'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON openchange.* TO 'openchange'@'%' WITH GRANT OPTION"

echo "=> Creating sogo database and user"
mysql -uroot -e "CREATE DATABASE sogo"
mysql -uroot -e "CREATE USER 'sogo'@'%' IDENTIFIED BY 'sogo'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON sogo.* TO 'sogo'@'%' WITH GRANT OPTION"

mysqladmin -uroot shutdown

echo "=> Done!"
touch /.mysql_admin_created

echo "========================================================================"
echo "You can now connect to this MySQL Server using:"
echo ""
echo "    mysql -uadmin -p$PASS -h<host> -P<port>"
echo ""
echo "MySQL user 'root' has no password but only allows local connections"
echo "========================================================================"
