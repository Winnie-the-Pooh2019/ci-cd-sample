FROM eclipse-temurin:21-jdk

ARG KOTLIN_VERSION=1.9.24
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl unzip \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sSL -o /tmp/kotlin.zip https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip \
    && unzip /tmp/kotlin.zip -d /opt \
    && rm /tmp/kotlin.zip
    
ENV PATH="/opt/kotlinc/bin:${PATH}"

COPY ./lib /app/lib
COPY ./src/main /app/src/main
COPY ./scripts /app/scripts

WORKDIR /app

RUN chmod +x ./scripts/build.sh \
    && ./scripts/build.sh

ENTRYPOINT ["java", "-cp", "out/app.jar:lib/*"]
