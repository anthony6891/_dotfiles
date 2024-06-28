#!/bin/bash

# Verificar si Lens está instalado
if command -v lens > /dev/null; then
    echo "Lens ya está instalado."
else
    echo "Instalando Lens..."

    # Descargar el paquete de instalación de Lens
    wget -O lens.deb https://api.k8slens.dev/binaries/Lens-5.3.1.amd64.deb

    # Instalar Lens desde el paquete .deb descargado
    sudo dpkg -i lens.deb

    # Instalar dependencias faltantes
    sudo apt install -f

    # Eliminar el paquete .deb después de la instalación
    rm lens.deb

    echo "Lens se ha instalado correctamente."
fi
