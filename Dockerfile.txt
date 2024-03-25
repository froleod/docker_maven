FROM maven:latest

WORKDIR /usr/src/app

COPY . .

RUN mvn clean package

