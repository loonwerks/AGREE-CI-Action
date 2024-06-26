# Container image that runs your code
FROM debian:bullseye-slim
LABEL org.opencontainers.image.source="https://github.com/loonwerks/AGREE-CI-Action"

# Fetch some basics
RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        libgtk-3-0 \
        tar \
        xauth \
        xvfb \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Copies script for construction of AGREE tool into the container
COPY make_agree.sh /make_agree.sh
RUN chmod +x /make_agree.sh

# Run the make agree script to download and install AGREE
RUN /make_agree.sh

