FROM maven:3.8.6 as builder
WORKDIR opt/app
COPY mvnw pom.xml ./
RUN mvn clean install -DskipTests
