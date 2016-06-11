
FROM archlinux

MAINTAINER Markus Blöchl <markus@blochl.de>

ENV ARCH_DATE 11.16.2016

RUN pacman -Syu --noconfirm --force

RUN pacman -S --noconfirm --needed --force \
    base-devel \
    git \
    cmake \
    zlib \
    doxygen \
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

CMD ["bash", "-l"]
