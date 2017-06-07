FROM shuimin/centos:7.3


RUN mkdir /workspace \
&& git clone http://git.oschina.net/edwinyxc/pond;

WORKDIR /workspace/pond

RUN ["mvn", "install"]

ENTRYPOINT ["/bin/bash, "-c", "echo Hello!"]