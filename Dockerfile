FROM jboss/wildfly
RUN chmod -R a+rw ${JBOSS_HOME}

USER root

RUN yum update -y
RUN yum -y install ant tar

# Deploy Axis files
ADD build/axis2-1.6.2.tar.gz ${JBOSS_HOME}/standalone/deployments/i2b2.war/
RUN touch ${JBOSS_HOME}/standalone/deployments/i2b2.war.dodeploy

# Ungzip the i2b2 install
ADD build/i2b2core-src-1708b.tar.gz /opt/i2b2/
COPY build/standalone.xml /opt/jboss-as-7.1.1.Final/standalone/configuration/

COPY build/deploy_cells.sh /opt/i2b2/
RUN chmod +x /opt/i2b2/deploy_cells.sh
RUN /opt/i2b2/deploy_cells.sh

RUN mkdir -p /opt/FRC
RUN chmod -R a+rw /opt/FRC


RUN chmod -R a+rw ${JBOSS_HOME}


USER jboss

EXPOSE 9090
EXPOSE 80