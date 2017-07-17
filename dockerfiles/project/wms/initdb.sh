#! /bin/sh
mysql -h172.18.0.5 -P3306 -uroot -proot --execute="CREATE DATABASE if not exists shuimin_wms;use shuimin_wms;source /opt/workspace/shuimin-wms/wms.sql;"