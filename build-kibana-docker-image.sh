#!/bin/bash

HUQ_DOCKER_REGISTRY_ORG=$1
ELASTIC_VERSION=$2
KIBANA_TAG=$3

git clone https://github.com/elastic/kibana-docker.git
cd kibana-docker

ELASTIC_REGISTRY=quay.io \
IMAGE_TAG=${HUQ_DOCKER_REGISTRY_ORG}/kibana \
ELASTIC_VERSION=${ELASTIC_VERSION} \
STAGING_BUILD_NUM=${KIBANA_TAG} \
IMAGE_FLAVORS=oss \
ARTIFACTS_DIR="$(pwd)/../kibana-artifacts" \
make build-from-local-artifacts

docker tag ${HUQ_DOCKER_REGISTRY_ORG}/kibana-oss:${ELASTIC_VERSION}-${KIBANA_TAG} ${HUQ_DOCKER_REGISTRY_ORG}/kibana:${ELASTIC_VERSION}-${KIBANA_TAG}-oss
docker rmi ${HUQ_DOCKER_REGISTRY_ORG}/kibana-oss:${ELASTIC_VERSION}-${KIBANA_TAG}
