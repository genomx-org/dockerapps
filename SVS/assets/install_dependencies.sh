#!/bin/bash
set -e

# This is to avoid the error
# 'debconf: unable to initialize frontend: Dialog'
export DEBIAN_FRONTEND=noninteractive

## Update apt-get
apt-get update

apt-get install -y --no-install-recommends apt-utils

## Basic Deps
apt-get install -y --no-install-recommends \
  libxext6 \
  libxrender1 \
  libnss3 \
  libxdamage1 \
  libxrandr2 \
  libxi6 \
  libxtst6 \
  libdbus-1-3 \
  libxcomposite-dev \
  libfreetype6 \
  libfontconfig \
  libxcursor-dev

## clean up
apt-get clean
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/lib/apt/lists/*
