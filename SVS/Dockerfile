# The base OS and SVS's version
ARG BASE_IMAGE=jlesage/baseimage-gui
ARG BASE_TAG=ubuntu-20.04
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

# Install xterm
RUN add-pkg xterm

# Add the app
ADD assets/${SVS_INSTALL_FILE} /opt/

# Install dependencies
COPY assets/install_dependencies.sh /tmp/install_dependencies.sh
RUN bash /tmp/install_dependencies.sh

# Copy startup script
COPY assets/startapp.sh /startapp.sh
