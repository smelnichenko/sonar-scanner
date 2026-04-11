FROM node:22-bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget -qO /tmp/jre.tar.gz https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.9%2B10/OpenJDK21U-jre_x64_linux_hotspot_21.0.9_10.tar.gz && \
    mkdir -p /opt/java && \
    tar -xzf /tmp/jre.tar.gz -C /opt/java --strip-components=1 && \
    rm /tmp/jre.tar.gz && \
    npm install -g sonarqube-scanner && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SONAR_SCANNER_JAVA_PATH=/opt/java/bin/java

ENTRYPOINT ["sonar-scanner"]
