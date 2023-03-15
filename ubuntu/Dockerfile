FROM ubuntu:22.04
# Label
LABEL name="unam-uime_ubuntu" \
      version="22.04" \
      url="https://github.com/Genomx-org/dockerapps" \
      vendor="ubuntu" \
      maintainer="gen@genomx.be" \
      description="Docker image with system dependencies to install ubuntu." \
      license="Artistic-2.0"

# Create group
USER root
ARG genomx=1100
RUN groupadd -g $genomx genomx

# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt install -y wget python3 python3-dev git curl \
  && rm -rf /var/lib/apt/lists/*

# Map users
COPY assets/custom_init.sh /tmp/custom_init.sh
COPY assets/users /tmp/users
RUN bash /tmp/custom_init.sh
