FROM node:22-bookworm-slim

# sonarqube-scanner pinned: 5.0 (2026-07-20) dropped the `sonar-scanner` command (only `sonar-scanner-npm` is left), and
# an unpinned rebuild on 2026-10-12 left every repo's CI sonar step "sonar-scanner: not found". 4.4.0 is the last release
# that installs it; a move to 5.x renames the command in this ENTRYPOINT and in every repo's pipeline together

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    wget -qO /tmp/jre.tar.gz https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.9%2B10/OpenJDK21U-jre_x64_linux_hotspot_21.0.9_10.tar.gz && \
    mkdir -p /opt/java && \
    tar -xzf /tmp/jre.tar.gz -C /opt/java --strip-components=1 && \
    rm /tmp/jre.tar.gz && \
    npm install -g sonarqube-scanner@4.4.0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SONAR_SCANNER_JAVA_EXE_PATH=/opt/java/bin/java

ENTRYPOINT ["sonar-scanner"]
