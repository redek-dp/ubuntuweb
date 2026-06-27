#!/bin/bash
set -e

echo "Instalando..."


cat << "EOF"

████  █████ ████  █████ █   █      ████  ████  
█   █ █     █   █ █     █  █       █   █ █   █ 
████  ████  █   █ ████  ███   ████ █   █ ████  
█  █  █     █   █ █     █  █       █   █ █   █ 
█   █ █████ ████  █████ █   █      ████  ████ 

            ISTALLER UBUNTU-WEB

EOF

echo ""
echo "Construa a imagem Docker:"
docker build -t ubuntu-vnc .
echo ""
echo "Execute o container:"
docker run -d \
--name ubuntu-vnc \
-p 5901:5901 \
-p 6080:6080 \
ubuntu-vnc
echo ""
echo "localhost:6080/vnc.html"
echo ""
echo "Senha:"
echo "123456"
echo ""