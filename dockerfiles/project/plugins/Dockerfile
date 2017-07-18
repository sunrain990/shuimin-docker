FROM shuimin/centos:7.3
MAINTAINER Kevin,S.Q.B <409747494@qq.com>

RUN git clone http://git.oschina.net/edwinyxc/pond /opt/workspace/pond;

WORKDIR /opt/workspace/pond

RUN ["mvn", "install"]

RUN git clone http://git.oschina.net/shuimin/report_view /opt/workspace/report_view;

WORKDIR /opt/workspace/report_view

RUN ["mvn", "install"]

CMD ["/usr/sbin/init"]