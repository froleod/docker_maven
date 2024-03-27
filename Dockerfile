# Используем образ с JDK и Maven для сборки приложения
FROM maven:3.8.3-openjdk-17 AS build

# Копируем исходный код приложения в рабочую директорию контейнера
COPY ./ /app
WORKDIR /app

# Устанавливаем wget и git, необходимые для установки зависимостей Maven
RUN apt-get update && apt-get install -y wget git

# Собираем приложение с помощью Maven
RUN mvn clean package

# Используем образ с JRE для запуска приложения
FROM openjdk:17-slim AS runtime

# Копируем собранный JAR-файл из предыдущего образа в текущий
COPY --from=build /app/target/myapp.jar /app/myapp.jar

# Устанавливаем команду для запуска приложения
CMD ["java", "-jar", "/app/myapp.jar"]
