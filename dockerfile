FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:8-jdk-alpine3.9
WORKDIR /app
COPY --from=build /app/target/my-project-1.0.0.jar /app/
EXPOSE 9099
CMD ["java", "-jar", "my-project-1.0.0.jar"]
