
FROM base/archlinux

MAINTAINER Markus Blöchl <blochl@in.tum.de>

ENV ARCH_DATE 04.11.2015

RUN pacman -Sy && \
    pacman-db-upgrade && \
    pacman -S archlinux-keyring --noconfirm --force && \
    pacman -Syu --noconfirm --force && \
    pacman-db-upgrade

RUN pacman -S --noconfirm --needed --force \
    base-devel \
    git \
    zlib \
    libutil-linux \
    help2man \
    graphviz \
    perl \
    tcl \
    lua \
    python \
    python-docutils \
    python-sphinx

RUN useradd -M -N packager

VOLUME /data
WORKDIR /data

CMD ["bash" "-l"]
