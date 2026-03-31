# SonarQube Scanner

Docker image with Node.js + Java JRE + sonarqube-scanner CLI. Used by all repo CI pipelines for SonarQube analysis.

## Image

`git.pmon.dev/schnappy/sonar-scanner:latest`

Contains: node:22-bookworm-slim + default-jre-headless + sonarqube-scanner (npm global)

## Usage in pipelines

```yaml
- name: sonar
  image: git.pmon.dev/schnappy/sonar-scanner:latest
  commands:
    - sonar-scanner -Dsonar.qualitygate.wait=true
```

## Full Infrastructure Docs

See `schnappy/ops` repo `CLAUDE.md` for complete infrastructure documentation.
