#!/bin/bash

# Verificar si Docker Engine está instalado
if docker --version > /dev/null 2>&1; then
    echo "Docker ya está instalado."
else
    echo "Instalando Docker Engine..."

    # Actualizar la lista de paquetes e instalar dependencias necesarias
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    # Agregar la clave GPG oficial de Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Agregar el repositorio de Docker a los sources.list
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # Actualizar la lista de paquetes e instalar Docker Engine
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    echo "Docker Engine se ha instalado correctamente."
fi

# Verificar si Docker Compose está instalado
if docker-compose --version > /dev/null 2>&1; then
    echo "Docker Compose ya está instalado."
else
    echo "Instalando Docker Compose..."

    # Descargar la última versión de Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Dar permisos de ejecución a Docker Compose
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Docker Compose se ha instalado correctamente."
fi
