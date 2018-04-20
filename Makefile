
build-env:
	docker build -f build-env.dockerfile -t ${HUQ_DOCKER_REGISTRY_ORG}/kibana:build-env .

