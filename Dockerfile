FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn -B -DskipTests clean package

FROM openjdk:17-jdk-alpine
WORKDIR /app

COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar

ENTRYPOINT ["java", "-jar", "demo.jar"]