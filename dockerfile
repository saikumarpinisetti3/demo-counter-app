FROM openjdk:8-jre-alpine

WORKDIR /app
COPY target/my-project-1.0.0.jar /app/

CMD ["java", "-jar", "my-project-1.0.0.jar"]
