FROM shuimin/pond:v0.1

RUN mkdir /root/.ssh/

ADD ./id_rsa /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa;

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan oschina.net >> /root/.ssh/known_hosts \
&& git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/docker-test;\


#RUN git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/shuimin-wms;\

WORKDIR /workspace/docker-test



CMD ["/usr/sbin/init"]


