FROM ubuntu:24.04

ARG USER_NAME=user
ARG UID=1000
ARG GID=1000

RUN apt-get update && apt-get install -y xterm x11-apps locales sudo

# fix locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# ubuntu 24.04 has ubuntu user with id 1000 and gid 1000
RUN sed -i '/^ubuntu:/d' /etc/passwd && \
    sed -i '/^ubuntu:/d' /etc/shadow && \
    sed -i '/^ubuntu:/d' /etc/group && \
    \
    groupadd -g $GID -o $USER_NAME && \
    useradd -m -u $UID -g $GID -o -s /bin/bash $USER_NAME -p '*' && \
    usermod -aG sudo $USER_NAME && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    true

USER $USER_NAME

