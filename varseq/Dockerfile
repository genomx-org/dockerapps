# The base OS and SVS's version
ARG BASE_IMAGE=dorowu/ubuntu-desktop-lxde-vnc
ARG BASE_TAG=focal
FROM ${BASE_IMAGE}:${BASE_TAG} AS base-os

# > after every FROM statements all the ARGs get collected and are no longer available
ARG BASE_OS_DISTRO=Lin64
ARG VARSEQ_VERSION=8.9.1
ARG VARSEQ_INSTALL_FILE=VarSeq-${BASE_OS_DISTRO}-${VARSEQ_VERSION}.tar.gz

# Environmental variables
ENV VARSEQ_VERSION=${VARSEQ_VERSION}
ENV VARSEQ_INSTALL_FILE=${VARSEQ_INSTALL_FILE}

# Label
LABEL name="unam-ume-goldenhelix/ubuntu-varseq" \
      version=$VARSEQ_VERSION \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="Golden Helix" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install Golden Helix SNP & Variation Suite software." \
      license="Artistic-2.0"

## Update apt-get
#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4EB27DB2A3B88B8B
#RUN apt-get update
#RUN apt-get install -y --no-install-recommends apt-utils

# Add the app
ADD assets/${VARSEQ_INSTALL_FILE} /opt/

# Create group
USER root
RUN groupadd -g 1100 genomx
RUN usermod -a -G genomx gen
RUN chgrp genomx /home/gen
RUN chmod 2777 -R /home/gen

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt install -y htop \
  && rm -rf /var/lib/apt/lists/*

   
