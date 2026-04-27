# sonar-scanner

Custom `sonar-scanner` image used by Woodpecker CI to push code-quality results to the cluster SonarQube (`schnappy-sonarqube` chart).

## Why custom

The upstream `sonar-scanner` image lags behind Node and ships an old JRE. This image bundles Node 22 and Adoptium Temurin 21 JRE, plus the npm-distributed `sonarqube-scanner` CLI as the entrypoint.

## Usage

Built by Woodpecker CI and pushed to `git.pmon.dev/schnappy/sonar-scanner`. Each service repo's `.woodpecker/ci.yaml` runs a `sonar-scanner` step against `https://sonar.pmon.dev` after tests pass.
