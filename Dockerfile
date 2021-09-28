FROM ubuntu
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install wget git default-jdk maven -y
RUN wget https://ftp.byfly.by/pub/apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz
RUN tar zxvf apache-tomcat-*.tar.gz -C /usr/local/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp ./target/hello*.war /usr/local/apache-tomcat-9.0.53/webapps/

EXPOSE 8080
CMD ["/usr/local/apache-tomcat-9.0.53/bin/catalina.sh", "run"]