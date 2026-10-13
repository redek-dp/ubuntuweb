#!/bin/bash

set -e

USER_HOME=/home/admin

mkdir -p ${USER_HOME}/.vnc

echo "123456" | vncpasswd -f > ${USER_HOME}/.vnc/passwd
chmod 600 ${USER_HOME}/.vnc/passwd
chown -R admin:admin ${USER_HOME}/.vnc

sudo -u admin vncserver :1 \
    -geometry 1200x600 \
    -depth 24 \
    -rfbauth ${USER_HOME}/.vnc/passwd

if [ ! -f /cert.pem ]; then
openssl req \
-x509 \
-newkey rsa:2048 \
-keyout /key.pem \
-out /cert.pem \
-days 365 \
-nodes \
-subj "/CN=localhost"
fi

websockify \
--web=/usr/share/novnc \
--cert=/cert.pem \
6080 \
localhost:5901

sudo apt update && sudo apt install firefox
sudo rm /etc/apt/preferences.d/mozilla-firefox
sudo printf "Package: firefox*\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001\n\nPackage: firefox*\nPin: release o=Ubuntu*\nPin-Priority: -1\n" | sudo tee /etc/apt/preferences.d/mozilla-firefox
sudo apt update
apt-cache policy firefox
sudo apt install --reinstall firefox

