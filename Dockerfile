FROM maven:latest

COPY . .

RUN mvn clean package
