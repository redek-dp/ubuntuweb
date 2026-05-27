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
docker build -t ubuntuweb .
echo ""
echo "Execute o container:"
docker run -d --name ubuntuweb -p 6080:6080 -p 5901:5901 ubuntuweb
echo ""
echo "localhost:6080/vnc.html"
echo ""