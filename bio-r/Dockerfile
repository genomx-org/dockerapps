# The base image and software version
ARG BASE_IMAGE=genomx_bioconductor
ARG BASE_TAG=devel
FROM ${BASE_IMAGE}:${BASE_TAG} AS base

# Label
LABEL name="bio-r" \
      version="devel" \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="genomx" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install bioconductor." \
      license="Artistic-2.0"

# Copy files
COPY assets/ /tmp/

# Map users and groups
USER root
RUN bash /tmp/installs.sh \
	&& bash /tmp/create_groups.sh \
	&& bash /tmp/create_users.sh  \
	&& bash /tmp/makedirs.sh
