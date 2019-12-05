FROM ubuntu:18.04

ARG USER_NAME=user
ARG UID=1000
ARG GID=1000

RUN apt-get update && apt-get install -y sudo dbus-x11 terminator build-essential cmake locales && \
    apt-get install -y gnome-terminal

# fix locales
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

RUN groupadd -g $GID -o $USER_NAME && \
    useradd -m -u $UID -g $GID -o -s /bin/bash $USER_NAME -p '*' && \
    usermod -aG sudo $USER_NAME && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    true

RUN apt-get install -y x11-apps

USER $USER_NAME

