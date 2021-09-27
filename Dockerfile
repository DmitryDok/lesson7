FROM openjdk:11-jdk

RUN apt update && apt install git -y
RUN cd /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN copy /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/

CMD ["mvn"]