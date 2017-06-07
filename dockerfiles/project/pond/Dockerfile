FROM shuimin/centos:7.3


RUN mkdir /workspace \
&& git clone http://git.oschina.net/edwinyxc/pond /workspace/pond;

WORKDIR /workspace/pond

RUN ["mvn", "install"]

CMD ["/usr/sbin/init"]