# The base OS and SVS's version
ARG BASE_IMAGE=bioconductor/bioconductor_docker
ARG BASE_TAG=RELEASE_3_16
FROM ${BASE_IMAGE}:${BASE_TAG} AS base-os

# Label
LABEL name="unam-ume-r/bioconductor" \
      version="RELEASE_3_16" \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="bioconductor" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install bioconductor." \
      license="Artistic-2.0"

# Create groups
ARG genomx=1100
RUN groupadd -g $genomx genomx
RUN usermod -a -G genomx rstudio

# Map users
COPY assets/map_users.sh /tmp/map_users.sh
COPY assets/users /tmp/users
RUN bash /tmp/map_users.sh
