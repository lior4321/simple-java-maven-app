# Stage 1: Build
FROM maven:3.9-openjdk-21 AS builder
COPY . .
RUN mvn clean package

# Stage 2: Runtime
FROM openjdk:21-jre-slim
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
