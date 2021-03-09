FROM ubuntu:20.04

ARG TIMEZONE="Europe/Moscow"

ENV TZ=${TIMEZONE} \
    DEBIAN_FRONTEND="noninteractive"

RUN apt-get update \
 && apt-get install -qy \
    tzdata \
    build-essential \
    apt-utils \
    git \
    gcc \
    make \
    libssl-dev \
    libzip-dev \
    libgdal-dev \
    libgd-dev \
    libsqlite3-dev
    # libpq-dev \
    # libssl-dev \

RUN git clone https://github.com/geofabrik/meta2tile.git /usr/src/meta2tile

WORKDIR /usr/src/meta2tile

RUN make

ENTRYPOINT ./meta2tile
