FROM ruby:2.7.8-slim

# Install essentails and node first before anything else to cache it for subsequent builds
RUN apt-get update -qq \
  && apt-get install -qq --no-install-recommends \
    build-essential curl git nano python2 \
  && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get update && apt-get install nodejs -y \
  && npm install -g yarn npm@10.7.0 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV EDITOR=nano
