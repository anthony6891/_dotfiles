#!/bin/bash

# Verificar si el controlador NVIDIA ya está instalado
if ! dpkg -l | grep -q "nvidia-driver"; then
    echo "Instalando el controlador de NVIDIA..."
    # Agregar repositorio non-free si no está habilitado
    sudo sed -i '/^# deb.*non-free/ s/^# //' /etc/apt/sources.list
    sudo apt update
    # Instalar el paquete del controlador NVIDIA
    sudo apt install -y nvidia-driver
else
    echo "El controlador de NVIDIA ya está instalado."
fi

# Verificar la instalación del controlador
echo "Verificando la instalación del controlador..."
sudo nvidia-smi

echo "¡Instalación completada!"
