FROM shuimin/plugins:0.0.1

RUN mkdir /root/.ssh/;

ADD ./id_rsa /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/id_rsa\
&& ssh-keyscan git.oschina.net >> /root/.ssh/known_hosts \
&& cd /opt/workspace \
&& git clone git@git.oschina.net:shuimin/shuimin-wms.git /opt/workspace/shuimin-wms;

ADD ./dev.sh /opt/workspace/shuimin-wms/dev.sh
ADD ./wms.sql /opt/workspace/shuimin-wms/wms.sql
ADD ./cp.conf /opt/workspace/shuimin-wms/src/main/resources/cp.conf



#chmod 600 /root/.ssh/id_rsa\
#&& git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/docker-test

# Create known_hosts
#RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
#RUN ssh-keyscan oschina.net >> /root/.ssh/known_hosts \
#&& git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/docker-test;\

#chmod 600 /root/.ssh/id_rsa


#RUN git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/shuimin-wms;\

WORKDIR /opt/workspace/shuimin-wms
#
#RUN echo 'hello world'\
#&&/opt/workspace/shuimin-wms/initdb.sh\
#&&echo 'hello world'
#mysql -h172.18.0.5 -P3306 -uroot -proot --execute="CREATE DATABASE if not exists shuimin_wms;use shuimin_wms;source /opt/workspace/shuimin-wms/wms.sql;"

EXPOSE 5584
CMD ["/bin/bash", "/opt/workspace/shuimin-wms/dev.sh"]

#CMD ["/usr/sbin/init"]


