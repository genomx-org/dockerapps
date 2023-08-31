#!/bin/bash
set -e

# This is to avoid the error
# 'debconf: unable to initialize frontend: Dialog'
export DEBIAN_FRONTEND=noninteractive

## Installs
apt-get update
apt-get install -y --no-install-recommends \
	fish \
	acl   \
        texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texi2html \
	texinfo \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Install BiocStyle (tex)
R -e 'BiocManager::install("BiocStyle")'

## The R Installation Manager (rig)[https://github.com/r-lib/rig]
curl -Ls https://github.com/r-lib/rig/releases/download/latest/rig-linux-latest.tar.gz |
  sudo tar xz -C /usr/local
