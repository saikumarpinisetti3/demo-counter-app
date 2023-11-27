# Stage 1: Build with Maven
FROM maven:3.6.3-openjdk-8 as build
WORKDIR /app
COPY . .
RUN mvn clean install

# Stage 2: Create a lightweight image with the JAR file
FROM openjdk:8-jdk-alpine3.9
WORKDIR /app
COPY --from=build /app/target/my-project-1.0.0.jar /app/
EXPOSE 4567  # Adjust to the port used by your Spark application
CMD ["java", "-jar", "/app/my-project-1.0.0.jar"]
