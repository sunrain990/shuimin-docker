 docker run -d -p 8080:80 --name website csphere/php-fpm:5.4 
 
 docker run -d -p 3306:3306 --name dbserver csphere/mysql:5.5
 
 
 docker build -t csphere/php-fpm:5.4 .

docker run -d -p 2222:22 (一直是2222port)
docker run -d -P 2222:22
-d 返回长id号
--name (别名)


docker exec -it website /bin/bash
supervisorctl (查看运行状态)

docker run -d -p 3306:3306 -v /var/lib/docker/vfs/dir/mydata:/var/lib/mysql csphere/mysql:5.5

docker run -d -p 80:80 --name wordpress -e WORDPRESS_DB_HOST=10.51.87.81 -e WORDPRESS_DB_USER=admin -e WORDPRESS_DB_PASSWORD=csphere2015 csphere/wordpress:4.2

 && yum swap fakesystemd systemd

1.ENTRYPOINT["executable","param1","param2"](the preferred exec form)

2.ENTRYPOINT command param1 param2(shell form)
# docker run -it -entrypoint=覆盖Dockerfile ENTRYPOINT []

1.CMD["executable","param1","param2"](the preferred exec form)

2.CMD["param1","param2"](as default parameters to ENTRYPOINT)

3.CMD command param1 param2(shell form)
"/bin/sh -c"

docker run -it csphere/cmd:0.1 /bin/bash
/bin/bash 覆盖 /bin/echo
docker run -it --entrypoint=/bin/bash csphere/ent:0.1
直接entrypoint 不能覆盖






docker run -d -p 5000:5000 --name registry registry:0.9.1

docker tag csphere/cmd:0.1 10.51.87.81:5000/csphere/cmd:0.1


















