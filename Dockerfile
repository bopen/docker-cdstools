FROM ubuntu:18.04 as deploy

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
        libnetcdf-dev \
        libproj-dev \
        libpq-dev \
        libudunits2-0 \
        netbase \
        pkg-config \
        python3.6-dev \
        python3-pip \
        python3-tk \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN python3 -m pip install -U \
        cython \
        numpy \
        pip \
        pytest-runner \
        setuptools \
        wheel
