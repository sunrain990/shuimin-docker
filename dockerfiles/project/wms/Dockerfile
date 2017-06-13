FROM shuimin/pond:0.0.1

RUN mkdir /root/.ssh/

ADD ./id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa\
&& ssh-keyscan git.oschina.net >> /root/.ssh/known_hosts \
&& cd /workspace \
&& git clone git@git.oschina.net:shuimin/shuimin-wms.git

ADD ./cp.conf /workspace/shuimin-wms/src/main/resources/cp.conf
ADD ./dev.sh /workspace/shuimin-wms/dev.sh
ADD ./wms.sql /workspace/shuimin-wms/wms.sql

RUN mysql --user="root" --password="root" --execute="CREATE DATABASE shuimin_wms;use shuimin_wms; source /workspace/shuimin-wms/wms.sql"

#chmod 600 /root/.ssh/id_rsa\
#&& git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/docker-test

# Create known_hosts
#RUN touch /root/.ssh/known_hosts
# Add bitbuckets key
#RUN ssh-keyscan oschina.net >> /root/.ssh/known_hosts \
#&& git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/docker-test;\

#chmod 600 /root/.ssh/id_rsa


#RUN git clone git@git.oschina.net:kevinsqb/docker-test.git /workspace/shuimin-wms;\

WORKDIR /workspace/shuimin-wms


EXPOSE 5584
CMD ["/bin/bash", "dev.sh"]

#CMD ["/usr/sbin/init"]


