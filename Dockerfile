FROM maven:latest

COPY . .

RUN mvn clean install

