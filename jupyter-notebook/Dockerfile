# The base OS and SVS's version
ARG BASE_IMAGE=jupyter/scipy-notebook:notebook-6.5.2
ARG BASE_TAG=RELEASE_6.5.2
FROM ${BASE_IMAGE}:${BASE_TAG} AS base-os

# Label
LABEL name="unam-ume-r/JupyterNotebooks" \
      version="RELEASE_6.5.2" \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="Docker-Stacks" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install bioconductor." \
      license="Artistic-2.0"

#Duda en qué van license

# Create groups
ARG genomx=1100
RUN groupadd -g $genomx genomx


# Map users
COPY bioconductor/assets/map_users.sh /tmp/map_users.sh
COPY bioconductor/assets/users /tmp/users
RUN bash /tmp/map_users.sh
