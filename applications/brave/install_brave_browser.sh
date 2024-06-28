#!/bin/bash

# Verificar si Brave Browser está instalado
if brave-browser --version > /dev/null 2>&1; then
    echo "Brave Browser ya está instalado."
else
    echo "Instalando Brave Browser..."

    # Importar la clave de Brave para el repositorio
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A8580BDC82D3DC6C

    # Añadir el repositorio de Brave a los sources.list
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser.list

    # Actualizar la lista de paquetes e instalar Brave Browser
    sudo apt update
    sudo apt install brave-browser -y

    echo "Brave Browser se ha instalado correctamente."
fi

# Actualizar Brave Browser si ya está instalado
if brave-browser --version > /dev/null 2>&1; then
    echo "Verificando actualizaciones de Brave Browser..."
    sudo apt update
    sudo apt upgrade brave-browser -y
    echo "Brave Browser se ha actualizado correctamente."
fi
