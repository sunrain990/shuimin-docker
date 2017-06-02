#!/usr/bin/env bash
set -e
docker build -t shuimin/centos:7.3 .
docker run -ti --privileged=true -d -p 2222:22 shuimin/centos:7.3

cd mariadb

# docker run -d -v /var/lib/mysql --name data-mysql --entrypoint /bin/echo shuimin/mysql:5.5
# docker run -ti --privileged=true -d --volumes-from data-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.5

docker build -t shuimin/mysql:5.7 .
docker run -d -v /var/lib/mysql --name data-mysql --entrypoint /bin/echo shuimin/mysql:5.7
docker run -ti --privileged=true -d --volumes-from data-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.7

#docker run -ti --privileged=true -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.5

# backup && restore
# ./volume_backup.sh data-mysql /var/lib/mysql
# docker stop data-mysql && docker rm data-mysql
# docker run -d -v /var/lib/mysql --name data-mysql --entrypoint /bin/echo shuimin/mysql:5.7
# ./volume_restore.sh data-mysql
# docker run -ti --privileged=true -d --volumes-from data-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.7
