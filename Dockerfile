FROM node:22-bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends default-jre-headless wget && \
    npm install -g sonarqube-scanner && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sonar-scanner"]
