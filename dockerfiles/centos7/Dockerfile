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
RUN yum -y install openssh-server passwd; yum clean all; yum -y install wget tar
ADD ./ssh/start.sh /start.sh
RUN mkdir /var/run/sshd;\
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '';\
chmod 755 /start.sh;\
./start.sh;\
systemctl enable sshd;

# jdk
WORKDIR /opt
RUN wget --continue --no-check-certificate -O jdk-8-linux-x64.tar.gz --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8-b132/jdk-8-linux-x64.tar.gz
RUN tar xzf jdk-8-linux-x64.tar.gz;\
rm -rf jdk-8-linux-x64.tar.gz;\
# alternatives --install /usr/bin/java java /opt/jdk-8-linux-x64;

EXPOSE 22

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]