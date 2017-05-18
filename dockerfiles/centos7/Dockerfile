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

ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

RUN yum -y update;

# systemd
RUN yum -y install systemd; yum clean all;\
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# sshd
RUN yum -y install openssh-server passwd; yum clean all
ADD ./ssh/start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

RUN chmod 755 /start.sh
# EXPOSE 22
RUN ./ssh/start.sh
RUN systemctl enable sshd;

# nginx
RUN yum -y install nginx;
RUN systemctl enable nginx;
EXPOSE 80

# mysql
RUN yum -y install --setopt=tsflags=nodocs epel-release && \
    yum -y install --setopt=tsflags=nodocs mariadb-server bind-utils pwgen psmisc hostname && \
    yum -y erase vim-minimal;

COPY ./mariadb/fix-permissions.sh ./
RUN ./mariadb/fix-permissions.sh /var/lib/mysql/   && \
   ./mariadb/fix-permissions.sh /var/log/mariadb/ && \
   ./mariadb/fix-permissions.sh /var/run/


VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]