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

# Install fish
RUN apt-get update && apt-get install -y fish

#Groups
USER root
RUN groupadd --key GID_MIN=1000 --key GID_MAX=1999 public
RUN groupadd --key GID_MIN=1000 --key GID_MAX=1999 genomx-org
RUN groupadd --key GID_MIN=1000 --key GID_MAX=1999 unam-org
RUN groupadd --key GID_MIN=1000 --key GID_MAX=1999 mcps-org

# Map users
COPY assets/create_users.sh /tmp/create_users.sh
COPY assets/create_user.sh /tmp/create_user.sh
COPY assets/users /tmp/users
RUN bash /tmp/create_users.sh

# Install poetry
USER root
RUN curl -sSL https://install.python-poetry.org | python3 - \
     && /root/.local/bin/poetry --version 
ENV PATH="/root/.local/bin:${PATH}"

#Install R 4.0.5 
#RUN DEBIAN_FRONTEND=noninteractive \
  #  apt-get update \
  #  && apt install -y r-base=4.0.5 r-base-core=4.0.5 r-base-dev=4.0.5\
 #   && rm -rf /var/lib/apt/lists/*

