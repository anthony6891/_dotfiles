#!/bin/bash

# Función para verificar si un comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Verificar si VS Code está instalado
if command_exists code; then
    echo "VS Code ya está instalado. Actualizando..."
    sudo apt update
    sudo apt install --only-upgrade code
else
    echo "VS Code no está instalado. Procediendo a la instalación..."
    # Añadir la clave GPG
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    
    # Añadir el repositorio de VS Code
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    
    # Actualizar el índice de paquetes e instalar VS Code
    sudo apt update
    sudo apt install code
fi

# Limpiar
rm packages.microsoft.gpg

echo "Proceso completado."
