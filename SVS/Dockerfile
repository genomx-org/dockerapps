# The base OS and SVS's version
ARG BASE_IMAGE=dorowu/ubuntu-desktop-lxde-vnc
ARG BASE_TAG=focal
FROM ${BASE_IMAGE}:${BASE_TAG} AS base-os

# > after every FROM statements all the ARGs get collected and are no longer available
ARG BASE_OS_DISTRO=Lin64
ARG SVS_VERSION=8.9.1
ARG SVS_INSTALL_FILE=SVS-${BASE_OS_DISTRO}-${SVS_VERSION}.tar.gz

# Environmental variables
ENV SVS_VERSION=${SVS_VERSION}
ENV SVS_INSTALL_FILE=${SVS_INSTALL_FILE}

# Label
LABEL name="unam-ume-goldenhelix/ubuntu-svs" \
      version=$SVS_VERSION \
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
ADD assets/${SVS_INSTALL_FILE} /opt/

  # Map users
COPY assets/map_users.sh /tmp/map_users.sh
COPY assets/users /tmp/users
RUN bash /tmp/map_users.sh

   
