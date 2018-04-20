FROM ubuntu:16.04

USER root
RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y apt-transport-https apt-utils git curl wget zip unzip jq && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update && \
	apt-get install -y --no-install-recommends yarn
