# The base OS and software version
ARG BASE_IMAGE=jupyter/scipy-notebook
ARG BASE_TAG=latest
FROM ${BASE_IMAGE}:${BASE_TAG} AS base-os

# Label
LABEL name="unam-ume/Jupyter" \
      version="latest" \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="Docker-Stacks" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install Jupyter." \
      license="Artistic-2.0"

# Create groups
ARG genomx=1100
RUN groupadd -g $genomx genomx

# Map users
COPY jupyter/assets/map_users.sh /tmp/map_users.sh
COPY jupyter/assets/users /tmp/users
RUN bash /tmp/map_users.sh
