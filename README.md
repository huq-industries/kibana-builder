# kibana-builder
Build kibana from source to a docker image with custom plugins

## How to build

1. make the build env this hardly changes so we will reuse it
```bash
HUQ_DOCKER_REGISTRY_ORG=quay.io/huqindustries make build-env
```
or
```bash
docker pull quay.io/huqindustries/kibana:build-env
```


