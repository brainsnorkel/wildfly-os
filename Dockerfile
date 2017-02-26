FROM jboss/wildfly
RUN chmod -R a+rw ${JBOSS_HOME}
