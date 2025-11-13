FROM eclipse-temurin:21-jre

COPY ./lib /app/lib
COPY ./src/main /app/src/main
COPY ./scripts /app/scripts

WORKDIR /app

RUN chmod +x ./scripts/build.sh \
    && ./scripts/build.sh

ENTRYPOINT ["java", "-cp", "out/app.jar:lib/*"]
