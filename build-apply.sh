#!/bin/sh

export TAG=${1:-latest}
docker build -t voyagerwoo/docker-logging-agent:${TAG} . \
&& docker push voyagerwoo/docker-logging-agent:${TAG} \
&& docker stack deploy -c=docker-stack.yml docker-logging-agent
 
