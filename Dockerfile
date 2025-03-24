FROM maven:3.8.6-openjdk-17 AS build
COPY ./ /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean package DskipTests

FROM openjdk:17-jdk-alpine
COPY --from=build /usr/src/app/target/*.jar /usr/app/app.jar
WORKDIR /usr/app
CMD ["java", "-jar", "app.jar"]