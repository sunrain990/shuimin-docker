FROM shuimin/centos:7.3
MAINTAINER Kevin,S.Q.B <409747494@qq.com>

RUN mkdir /opt/workspace \
&& git clone http://git.oschina.net/edwinyxc/pond /opt/workspace/pond;

WORKDIR /opt/workspace/pond

RUN ["mvn", "install"]

CMD ["/usr/sbin/init"]