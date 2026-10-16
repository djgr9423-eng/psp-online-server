# Builds the upstream, protocol-compatible aemu_postoffice server.
# The upstream source is fetched at build time; this repository does not vendor it.
FROM ubuntu:24.04 AS build

ARG DEBIAN_FRONTEND=noninteractive
ARG AEMU_REPOSITORY=https://github.com/Kethen/aemu_postoffice.git
ARG AEMU_REF=main

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates git g++ make \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch "${AEMU_REF}" "${AEMU_REPOSITORY}" /opt/aemu_postoffice

WORKDIR /opt/aemu_postoffice/server_cpp
RUN bash build_linux.sh

FROM ubuntu:24.04 AS runtime
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/aemu_postoffice/server_cpp
COPY --from=build /opt/aemu_postoffice /opt/aemu_postoffice
COPY config.json /opt/aemu_postoffice/server_cpp/config.json

# aemu_postoffice defaults: adhocctl 27312, relay 27313, status HTTP 8888.
EXPOSE 27312/tcp 27312/udp 27313/tcp 27313/udp 8888/tcp

# The upstream executable reads config.json and game_db.json beside itself.
CMD ["./aemu_postoffice"]
