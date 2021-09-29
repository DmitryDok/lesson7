FROM ubuntu
RUN echo Europe/Minsk > /etc/timezone
RUN apt update && apt install git default-jdk maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package -f /boxfuse-sample-java-war-hello/pom.xml
