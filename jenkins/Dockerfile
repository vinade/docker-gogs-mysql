FROM jenkinsci/jenkins

USER root

# Install selected extensions and other stuff
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

RUN apt-get update \
    && apt-get -y install \
    docker-ce \
    docker-ce-cli \
    containerd.io
