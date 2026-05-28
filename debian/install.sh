#!/bin/bash
set -e

echo "Instalando..."

cat << "EOF"

████  █████ ████  █████ █   █      ████  ████  
█   █ █     █   █ █     █  █       █   █ █   █ 
████  ████  █   █ ████  ███   ████ █   █ ████  
█  █  █     █   █ █     █  █       █   █ █   █ 
█   █ █████ ████  █████ █   █      ████  ████ 

             ISTALLER DEBIAN-WEB

EOF

echo ""
echo "Construindo a imagem Docker:"
cat << 'EOF' > docker-compose.yml
services:
  debian-desktop:
    image: lscr.io/linuxserver/webtop:debian-xfce
    container_name: debian_gui
    privileged: true
    ports:
      - '6080:3000'
EOF
echo ""
echo "Execute o container:"

docker compose down
docker compose up -d
docker logs -f debian_gui

echo ""
echo "localhost:6080/"
echo ""