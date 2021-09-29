FROM ubuntu
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install git default-jdk maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package -f /boxfuse-sample-java-war-hello/pom.xml
RUN cp /boxfuse-sample-java-war-hello/target/hello*.war /data