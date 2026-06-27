FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Usuário e senha
ENV USERNAME=devcom
ENV PASSWORD=d123456

RUN apt update -y && apt install --no-install-recommends -y \
    xfce4 xfce4-goodies \
    tigervnc-standalone-server \
    novnc websockify sudo \
    xterm init systemd snapd \
    vim net-tools curl wget git tzdata \
    dbus-x11 x11-utils x11-xserver-utils x11-apps \
    software-properties-common

RUN add-apt-repository ppa:mozillateam/ppa -y

RUN echo 'Package: *' >> /etc/apt/preferences.d/mozilla-firefox && \
    echo 'Pin: release o=LP-PPA-mozillateam' >> /etc/apt/preferences.d/mozilla-firefox && \
    echo 'Pin-Priority: 1001' >> /etc/apt/preferences.d/mozilla-firefox

RUN echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:jammy";' \
    > /etc/apt/apt.conf.d/51unattended-upgrades-firefox

RUN apt update && \
    apt install -y firefox xubuntu-icon-theme obs-studio

# Criar usuário
RUN useradd -m -s /bin/bash $USERNAME && \
    echo "$USERNAME:$PASSWORD" | chpasswd && \
    usermod -aG sudo $USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

RUN mkdir -p ~/.vnc

# Criar senha do VNC
RUN echo "$PASSWORD" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

RUN touch ~/.Xauthority

EXPOSE 5901
EXPOSE 6080

CMD bash -c '\
vncserver :1 \
-geometry 1280x720 \
-rfbauth ~/.vnc/passwd && \
openssl req -new -subj "/C=JP" -x509 -days 365 -nodes \
-out self.pem -keyout self.pem && \
websockify -D --web=/usr/share/novnc/ \
--cert=self.pem 6080 localhost:5901 && \
tail -f /dev/null'