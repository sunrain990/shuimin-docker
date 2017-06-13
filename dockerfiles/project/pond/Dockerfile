FROM shuimin/mysql:5.7


RUN mkdir /workspace \
&& git clone http://git.oschina.net/edwinyxc/pond /workspace/pond;

WORKDIR /workspace/pond

RUN ["mvn", "install"]

CMD ["/usr/sbin/init"]