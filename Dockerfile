FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello/ /tmp/
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package

FROM tomcat:9.0-jre8-alpine
COPY --from=MAVEN_TOOL_CHAIN /tmp/boxfuse-sample-java-war-hello/target/hello*.war $CATALINA_HOME/webapps/hello.war

HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/hello/ || exit 1