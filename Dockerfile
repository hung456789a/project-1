# Build stage
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/hello-java-1.0-SNAPSHOT-shaded.jar app.jar
CMD ["java", "-jar", "app.jar"]
