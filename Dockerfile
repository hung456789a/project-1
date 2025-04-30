FROM maven:3.6-openjdk-17 AS maven_tool
WORKDIR /tmp/
COPY pom.xml /tmp/
COPY src /tmp/src/
RUN mvn -B clean package
FROM openjdk:17-jdk
EXPOSE 8080
COPY --from=maven_tool /tmp/target/*.jar /app/spring-boot-application.jar
WORKDIR /app
ENTRYPOINT [ "jar", "-jar", "/app/spring-boot-application.jar" ]