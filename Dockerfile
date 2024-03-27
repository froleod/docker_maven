FROM maven:3.8.3-openjdk-17 AS build


COPY ./ /app
WORKDIR /app

RUN mvn clean package


FROM openjdk:17-slim AS runtime

COPY --from=build /app/target/myapp.jar /app/myapp.jar

CMD ["java", "-jar", "/app/myapp.jar"]
