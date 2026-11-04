#!/usr/bin/env bash

set -euo pipefail

container_name="ubuntu-vnc"

if ! command -v docker >/dev/null 2>&1; then
    echo "Docker não está instalado ou não está no PATH." >&2
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo "Não foi possível acessar o Docker. Inicie o serviço ou execute com sudo." >&2
    exit 1
fi

if ! docker container inspect "$container_name" >/dev/null 2>&1; then
    echo "O container '$container_name' não existe. Crie-o primeiro com ./install.sh." >&2
    exit 1
fi

docker restart "$container_name"
echo "Projeto reiniciado. Acesse https://localhost:6080/vnc.html"