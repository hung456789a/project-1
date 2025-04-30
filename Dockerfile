FROM maven:3.9.9-eclipse-temurin-8-alpine
WORKDIR /tmp/
COPY pom.xml /tmp/
COPY src /tmp/src/
COPY mvnw /tmp/
COPY mvnw.cmd /tmp/
RUN mvn -B clean package
FROM openjdk:19-jdk-alpine
COPY --from=maven /tmp/target/*.jar /app/spring-boot-application.jar
WORKDIR /app
ENTRYPOINT [ "jar", "-jar", "spring-boot-application.jar" ]