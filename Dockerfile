FROM maven:3.6-openjdk-17 AS maven_tool
WORKDIR /tmp/
COPY pom.xml /tmp/
COPY src /tmp/src/
COPY mvnw /tmp/
COPY mvnw.cmd /tmp/
RUN mvn -B clean package
FROM openjdk:17-jdk
COPY --from=maven_tool /tmp/target/*.jar /app/spring-boot-application.jar
WORKDIR /app
ENTRYPOINT [ "jar", "-jar", "spring-boot-application.jar" ]