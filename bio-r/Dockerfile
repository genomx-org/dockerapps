# The base image and software version
ARG BASE_IMAGE=bioconductor/bioconductor_docker
ARG BASE_TAG=RELEASE_3_16
FROM ${BASE_IMAGE}:${BASE_TAG} AS base-os

# Label
LABEL name="unam-uime_bio-r" \
      version="RELEASE_3_16" \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="bioconductor" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install bioconductor." \
      license="Artistic-2.0"


# Map users
COPY assets/map_users.sh /tmp/map_users.sh
COPY assets/users /tmp/users
RUN bash /tmp/map_users.sh

# Install python and other dependencies
#RUN DEBIAN_FRONTEND=noninteractive \
 # apt-get update \
 # && apt install -y python3.11 python3-pip curl \
 # && rm -rf /var/lib/apt/lists/*

# Install poetry
#RUN curl -sSL https://install.python-poetry.org | python3 -

#Install R 4.0.5 
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt install -y r-base=4.0.5 r-base-core=4.0.5 r-base-dev=4.0.5\
    && rm -rf /var/lib/apt/lists/*

