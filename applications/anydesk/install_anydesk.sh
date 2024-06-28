#!/bin/bash

# Verificar si AnyDesk está instalado
if dpkg -s anydesk &> /dev/null; then
    echo "AnyDesk ya está instalado."
else
    echo "Instalando AnyDesk..."

    # Descargar el paquete de instalación de AnyDesk
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
    echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list

    # Actualizar la lista de paquetes e instalar AnyDesk
    sudo apt update
    sudo apt install anydesk -y

    echo "AnyDesk se ha instalado correctamente."
fi
