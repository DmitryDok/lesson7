FROM ubuntu as webapp
RUN echo Europe/Minsk > /etc/timezone
RUN apt update && apt install git default-jdk maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package

FROM davidcaste/alpine-tomcat:jre7tomcat8
COPY --from=webapp /boxfuse-sample-java-war-hello/target/hello*.war $TOMCAT_HOME/webapps/
EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
