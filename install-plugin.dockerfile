ARG BASE_IMAGE
ARG BASE_IMAGE_TAG

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}

RUN bin/kibana-plugin install x-pack
