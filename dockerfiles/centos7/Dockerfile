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

# sshd && tools
RUN yum -y install openssh-server passwd; yum clean all; yum -y install wget tar git
ADD ./ssh/start.sh /start.sh
RUN mkdir /var/run/sshd;\
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '';\
chmod 755 /start.sh;\
./start.sh;\
systemctl enable sshd;

# jdk
RUN wget http://www.oracle.com/technetwork/java/javase/downloads/index.html -O ./index.html &&  cat index.html| grep -Eoi '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+.html'| (head -n 1) | awk '{print "http://www.oracle.com"$1}'| xargs wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" -O index.html -q&& grep -Eoi '"filepath":"[^"]+jdk-8u[0-9]+-linux-x64.rpm"' index.html |grep -Eoi 'http:[^"]+'|xargs wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" -O ./jdk8.rpm && rpm -i ./jdk8.rpm;

# maven
RUN wget http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz;\
tar xzf apache-maven-3.3.9-bin.tar.gz;\
mkdir /usr/local/maven;\
mv apache-maven-3.3.9/ /usr/local/maven/ ;\
alternatives --install /usr/bin/mvn mvn /usr/local/maven/apache-maven-3.3.9/bin/mvn 1;
#echo 'export JAVA_HOME='$(find /usr/java/ -maxdepth 1 -name "jdk*" -type d) >> /etc/profile;\
#echo 'export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar'>> /etc/profile;\
#echo 'export PATH=$PATH:$JAVA_HOME/bin'>> /etc/profile;\
#source /etc/profile;
RUN WHERE_JDK=$(find /usr/java/ -maxdepth 1 -name "jdk*" -type d)
RUN echo $WHERE_JDK
ENV JAVA_HOME $WHERE_JDK
ENV MAVEN_HOME /usr/local/maven/apache-maven-3.3.9
ENV PATH $JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH

EXPOSE 22

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]