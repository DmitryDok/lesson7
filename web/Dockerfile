FROM davidcaste/alpine-tomcat:jre7tomcat8
RUN cp /data/hello*.war /$TOMCAT_HOME/webapps/
EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
