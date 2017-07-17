#!/usr/bin/env bash
set -e
docker network create --subnet=172.18.0.0/16 shadownet
docker build -t shuimin/centos:7.3 .
docker run -ti --restart=always --privileged=true -d --network=shadownet --ip=172.18.0.4 -p 2222:22 shuimin/centos:7.3

cd mariadb

# docker run -d -v /var/lib/mysql --name data-mysql --entrypoint /bin/echo shuimin/mysql:5.5
# docker run -ti --privileged=true -d --volumes-from data-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.5

docker build -t shuimin/mysql:5.7 .
docker run -d -v /var/lib/mysql --name data-mysql --entrypoint /bin/echo shuimin/mysql:5.7
docker run -ti --restart=always --privileged=true -d --volumes-from data-mysql --network=shadownet --ip=172.18.0.5 -p 3307:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.7

#docker run -ti --privileged=true -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.5

# backup && restore
# ./volume_backup.sh data-mysql /var/lib/mysql
# docker stop data-mysql && docker rm data-mysql
# docker run -d -v /var/lib/mysql --name data-mysql --entrypoint /bin/echo shuimin/mysql:5.7
# ./volume_restore.sh data-mysql
# docker run -ti --privileged=true -d --volumes-from data-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root shuimin/mysql:5.7

cd ../../project/pond

docker build -t shuimin/pond:0.0.1 .

docker run -ti --restart=always --privileged=true -d --network=shadownet --ip=172.18.0.6 -p 2223:22 shuimin/pond:0.0.1

cd ../wms

docker build -t shuimin/wms:0.0.1 .

docker run -ti --restart=always --privileged=true -d --network=shadownet --ip=172.18.0.7 -p 2224:22 -p 5584:5584 shuimin/wms:0.0.1