FROM --platform=linux/amd64 ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV VNC_PORT=5901
ENV NOVNC_PORT=6080
ENV VNC_RESOLUTION=900x600
ENV VNC_DEPTH=24

ARG USERNAME=admin
ARG PASSWORD=123456

RUN apt-get update && apt-get install -y \
    supervisor \
    xfce4 \
    xfce4-goodies \
    dbus-x11 \
    x11-xserver-utils \
    x11-apps \
    tigervnc-standalone-server \
    novnc \
    websockify \
    xterm \
    sudo \
    curl \
    wget \
    git \
    vim \
    net-tools \
    unzip \
    zip \
    openssl \
    ca-certificates \
    pulseaudio \
    pavucontrol \
    ffmpeg \
    fonts-dejavu \
    locales \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y firefox

RUN locale-gen en_US.UTF-8

RUN useradd -m -s /bin/bash ${USERNAME} \
 && echo "${USERNAME}:${PASSWORD}" | chpasswd \
 && usermod -aG sudo ${USERNAME} \
 && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}
WORKDIR /home/${USERNAME}

RUN mkdir -p ~/.vnc

RUN printf "#!/bin/bash\nstartxfce4\n" > ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup

COPY start.sh /start.sh

USER root

RUN chmod +x /start.sh

EXPOSE 5901 6080

CMD ["/start.sh"]