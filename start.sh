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


# 1. Definir o Tema Visual (Interface e Bordas das Janelas)
xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird-dark"
xfconf-query -c xfwm4 -p /general/theme -s "Greybird-dark"

# 2. Definir o Tema de Ícones (Elementary/Xubuntu padrão)
xfconf-query -c xsettings -p /Net/IconThemeName -s "Humanity-Dark"

# 3. Configurar o Painel na Parte Inferior (Estilo Dock/Taskbar)
# Define o painel 1 para não ocupar a tela inteira se desejar, ou apenas garante a posição embaixo
xfconf-query -c xfce4-panel -p /panels/panel-1/position -s "p=10;x=0;y=0" 2>/dev/null || \
xfconf-query -c xfce4-panel -p /panels/panel-0/position -s "p=10;x=0;y=0"

# 4. Configurar o Fundo de Tela Degradê (Roxo/Azul escuro)
# No XFCE, se você não quiser usar uma imagem, pode definir cores sólidas ou degradê vertical:
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/color-style -s 1 # 1 = Degradê Vertical
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/color1 -set 17476 10280 23644 65535 # Roxo superior
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/color2 -set 3598 6425 10794 65535  # Azul escuro inferior
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/image-show -s false              # Desativa imagem para usar o degradê

# Reinicia o painel e a área de trabalho para aplicar as mudanças de layout com segurança
xfce4-panel -r
xfdesktop -reload

