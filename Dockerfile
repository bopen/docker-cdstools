FROM ubuntu:16.04 as deploy

MAINTAINER Alessandro Amici <a.amici@bopen.eu>

ARG DEBIAN_FRONTEND="noninteractive"

ENV LC_ALL="C.UTF-8" \
    LANG="C.UTF-8"

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        cdo \
        ffmpeg \
        libcap-dev \
        libdb-dev \
        libffi-dev \
        libgeos-dev \
        libproj-dev \
        libpq-dev \
        libudunits2-0 \
        netbase \
        pkg-config \
        python3.5-dev \
        python3-pip \
        python3-setuptools \
        python3-tk \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -g 999 dockeruser \
 && useradd -r -u 999 -g dockeruser dockeruser

USER dockeruser
