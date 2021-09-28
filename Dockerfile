FROM ubuntu as webapp
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install git default-jdk maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package

FROM davidcaste/alpine-tomcat:jre7tomcat8
RUN apk update
RUN apk add wget
COPY --from=webapp /boxfuse-sample-java-war-hello/target/hello*.war $TOMCAT_HOME/webapps/
EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
