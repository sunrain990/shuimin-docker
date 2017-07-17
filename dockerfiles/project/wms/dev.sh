#! /bin/sh
mvn clean compile exec:java \
-Dexec.mainClass=com.shuimin.wms.App \
-Dpond.web.BaseServer.port=5584 \
-Dpond.debug=true \
-Dpond.debug_classes=pond.web.Pond \
-Dcrm.hostname=localhost \
-Dfile.encoding=utf8