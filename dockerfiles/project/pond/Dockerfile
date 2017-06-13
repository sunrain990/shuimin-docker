FROM shuimin/mysql:5.7
MAINTAINER Kevin,S.Q.B <409747494@qq.com>

RUN mkdir ~/workspace &&\
 echo $(pwd) &&\
 mkdir /workspace \
&& git clone http://git.oschina.net/edwinyxc/pond /workspace/pond;

WORKDIR /workspace/pond

RUN ["mvn", "install"]

CMD ["/usr/sbin/init"]