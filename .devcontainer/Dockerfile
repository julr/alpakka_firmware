FROM debian:stable-slim

RUN apt update && apt install -y --no-install-recommends \
    cmake \
    ninja-build \
    python3 \
    python3-pip \
    gcc \
    g++ \
    libc6-dev \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    git \
    ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/raspberrypi/pico-sdk /opt/sdk/pico-sdk \
    && cd /opt/sdk/pico-sdk \
    && git submodule update --init

ENV PICO_SDK_PATH=/opt/sdk/pico-sdk