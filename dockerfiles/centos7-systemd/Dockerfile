#
# MAINTAINER        Kevin,S.Q.B <409747494@qq.com>
# DOCKER-VERSION    1.6.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#
FROM       centos:centos7.3.1611
MAINTAINER Kevin,S.Q.B <409747494@qq.com>

ENV TZ "Asia/Shanghai"
ENV TERM xterm
ENV container docker

RUN yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel && \
    yum install -y --enablerepo=epel pwgen python-pip && \
    yum clean all

RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all;
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);
rm -f /lib/systemd/system/multi-user.target.wants/*;
rm -f /etc/systemd/system/*.wants/*;
rm -f /lib/systemd/system/local-fs.target.wants/*;
rm -f /lib/systemd/system/sockets.target.wants/*udev*;
rm -f /lib/systemd/system/sockets.target.wants/*initctl*;
rm -f /lib/systemd/system/basic.target.wants/*;
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

EXPOSE 22