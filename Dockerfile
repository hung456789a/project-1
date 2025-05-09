# Build stage
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:17-jdk
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
