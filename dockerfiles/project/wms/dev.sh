#! /bin/sh

mysql -h172.18.0.5 -P3306 -uroot -proot --execute="CREATE DATABASE if not exists shuimin_wms;use shuimin_wms;source /opt/workspace/shuimin-wms/wms.sql;"

mvn clean compile exec:java \
-Dexec.mainClass=com.shuimin.wms.App \
-Dpond.web.BaseServer.port=5584 \
-Dpond.debug=true \
-Dpond.debug_classes=pond.web.Pond \
-Dcrm.hostname=localhost \
-Dfile.encoding=utf8