FROM maven:3.8-jdk-8 AS builder 
WORKDIR /app
COPY . .
RUN mvn -B package

FROM openjdk:8-slim
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]