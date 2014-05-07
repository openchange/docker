FROM tutum/mysql
MAINTAINER Julio García <jjgarcia@zentyal.com>

# Add image configuration with custom configurations
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh

EXPOSE 3306
CMD ["/run.sh"]
