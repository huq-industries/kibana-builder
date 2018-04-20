ARG KIBANA_BUILD_ENV_IMAGE

FROM $KIBANA_BUILD_ENV_IMAGE

RUN groupadd --gid 1000 kibana && \
    useradd --uid 1000 --gid 1000 -m kibana

USER kibana

RUN git clone https://github.com/huq-industries/kibana.git /home/kibana/kibana

ARG KIBANA_BRANCH
ENV KIBANA_BRANCH=$KIBANA_BRANCH

RUN cd /home/kibana/kibana && \
	git fetch --all && \
	git checkout -b $KIBANA_BRANCH origin/$KIBANA_BRANCH

RUN cd /home/kibana && \
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash && \
	. /home/kibana/.profile && \
	cd /home/kibana/kibana && \
	nvm install v"$(cat .node-version)" && \
	yarn && \
	yarn build --release --skip-os-packages
