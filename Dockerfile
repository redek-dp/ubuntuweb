FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Usuário
ENV USERNAME=admin
ENV PASSWORD=123456

# Atualização
RUN apt-get update && apt-get upgrade -y

# Pacotes
RUN apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    tigervnc-common \
    novnc \
    websockify \
    xterm \
    dbus-x11 \
    x11-xserver-utils \
    x11-apps \
    firefox \
    obs-studio \
    xubuntu-icon-theme \
    sudo \
    curl \
    wget \
    git \
    net-tools \
    vim \
    openssl \
    ca-certificates \
    tzdata

# Limpeza
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Criar usuário
RUN useradd -m -s /bin/bash ${USERNAME}

RUN echo "${USERNAME}:${PASSWORD}" | chpasswd

RUN usermod -aG sudo ${USERNAME}

USER ${USERNAME}

WORKDIR /home/${USERNAME}

# Diretórios
RUN mkdir -p ~/.vnc

# Criar senha do VNC
RUN printf "%s\n%s\nn\n" "${PASSWORD}" "${PASSWORD}" | vncpasswd

# xstartup
RUN echo '#!/bin/sh' > ~/.vnc/xstartup && \
    echo 'unset SESSION_MANAGER' >> ~/.vnc/xstartup && \
    echo 'unset DBUS_SESSION_BUS_ADDRESS' >> ~/.vnc/xstartup && \
    echo 'startxfce4 &' >> ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup

RUN touch ~/.Xauthority

EXPOSE 5901
EXPOSE 6080

CMD bash -c '\
vncserver :1 \
-geometry 1280x720 \
-depth 24 && \
openssl req \
-new \
-x509 \
-days 365 \
-nodes \
-subj "/CN=localhost" \
-out /home/'"${USERNAME}"'/self.pem \
-keyout /home/'"${USERNAME}"'/self.pem && \
websockify \
--web=/usr/share/novnc \
--cert=/home/'"${USERNAME}"'/self.pem \
6080 \
localhost:5901 && \
tail -f /dev/null'