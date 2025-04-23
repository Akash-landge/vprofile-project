FROM maven:3.8.8 AS builder
WORKDIR /app
COPY . .
RUN mvn clean install

# Use OpenJDK for runtime
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/myapp.jar .
CMD ["java", "-jar", "myapp.jar"]
