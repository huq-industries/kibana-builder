
build-env:
	docker build -f build-env.dockerfile -t ${HUQ_DOCKER_REGISTRY_ORG}/kibana:build-env .

artifacts: clean-artifacts
	docker build -f artifacts.dockerfile -t ${HUQ_DOCKER_REGISTRY_ORG}/kibana:${ELASTIC_VERSION}-${KIBANA_TAG}-artifacts \
	--build-arg KIBANA_BRANCH=${HUQ_KIBANA_BRANCH} \
	--build-arg KIBANA_BUILD_ENV_IMAGE=${HUQ_DOCKER_REGISTRY_ORG}/kibana:build-env .
	docker run --detach --rm --name kibana-artifacts ${HUQ_DOCKER_REGISTRY_ORG}/kibana:${ELASTIC_VERSION}-${KIBANA_TAG}-artifacts /bin/sleep 60
	docker cp kibana-artifacts:/home/kibana/kibana/target/. kibana-artifacts/kibana/target
	docker kill kibana-artifacts

clean-artifacts:
	-rm kibana-artifacts/kibana/target/*
	-rm kibana-artifacts/x-pack-kibana/build/distributions/*

base-image:
	sh build-kibana-docker-image.sh ${HUQ_DOCKER_REGISTRY_ORG} ${ELASTIC_VERSION} ${KIBANA_TAG}
