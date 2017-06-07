FROM shuimin/pond:v0.1

RUN mkdir /root/.ssh/ \

ADD ./id_rsa /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
RUN ssh-keyscan oschina.net >> /root/.ssh/known_hosts \
&& git clone git@oschina.net:skygufei/shuimin-wms.git /workspace/shuimin-wms;\

WORKDIR /workspace/shuimin-wms

CMD ["/bin/bash, "/workspace/shuimin-wms/dev.sh"]


