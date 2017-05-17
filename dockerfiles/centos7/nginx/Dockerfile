#
# MAINTAINER        Kevin,S.Q.B <409747494@qq.com>
# DOCKER-VERSION    1.6.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       shuimin/centos:7.3
MAINTAINER Kevin,S.Q.B <409747494@qq.com>

RUN yum -y install nginx;
RUN systemctl enable nginx;

EXPOSE 80
CMD ["/usr/sbin/init"]