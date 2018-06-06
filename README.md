# kibana-builder
Build kibana from source to a docker image with custom plugins

**ATTENTION**: This works only on linux machines becasue of [kibana-docker](https://github.com/elastic/kibana-docker).


## How to build

1. make the build env this hardly changes so we will reuse it
```bash
sudo make HUQ_DOCKER_REGISTRY_ORG=quay.io/huqindustries build-env
```
or
```bash
docker pull quay.io/huqindustries/kibana:build-env
```

2. Build the artifact form source
```bash
sudo make HUQ_DOCKER_REGISTRY_ORG=quay.io/huqindustries ELASTIC_VERSION=6.2.3 KIBANA_TAG=huq HUQ_KIBANA_BRANCH=... artifacts
```
This will pull down kibana repo, check out the `HUQ_KIBANA_BRANCH` and build it.

3. Build the docker image
```bash
sudo make HUQ_DOCKER_REGISTRY_ORG=quay.io/huqindustries ELASTIC_VERSION=6.2.3 KIBANA_TAG=huq base-image
```

4. Install plugins
```bash
sudo make HUQ_DOCKER_REGISTRY_ORG=quay.io/huqindustries ELASTIC_VERSION=6.2.3 KIBANA_TAG=huq install-plugin
```
