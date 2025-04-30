FROM maven:3.5.2-jdk-8-alpine
WORKDIR /tmp/
COPY pom.xml /tmp/
COPY src /tmp/src/
COPY mvnw /tmp/
COPY mvnw.cmd /tmp/
RUN mkdir -p /tmp/.mvn/wrapper/
RUN chmod +x mvnw
RUN mvn -B clean package
FROM openjdk:8-jre-alpine
COPY --from=maven /tmp/target/*.jar /app/spring-boot-application.jar
WORKDIR /app
ENTRYPOINT [ "jar", "-jar", "spring-boot-application.jar" ]