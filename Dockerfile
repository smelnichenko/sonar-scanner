FROM node:22-bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget apt-transport-https gpg && \
    wget -qO- https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor -o /usr/share/keyrings/adoptium.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb bookworm main" > /etc/apt/sources.list.d/adoptium.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends temurin-21-jre-headless && \
    npm install -g sonarqube-scanner && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SONAR_SCANNER_JAVA_PATH=/usr/lib/jvm/temurin-21-jre-amd64/bin/java

ENTRYPOINT ["sonar-scanner"]
