#!/bin/bash

# Obtener el usuario actual
USER=$(whoami)

# Ruta al archivo settings.json
SETTINGS_FILE="/home/$USER/.config/Code/User/settings.json"

# Verificar si existe el archivo settings.json
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "No se encontró el archivo settings.json en la ruta $SETTINGS_FILE"
    exit 1
fi

# Leer extensiones recomendadas del archivo settings.json
EXTENSIONS=$(jq -r '.extensions.recommendations[]' "$SETTINGS_FILE")

# Instalar cada extensión recomendada
for EXTENSION in $EXTENSIONS; do
    code --install-extension "$EXTENSION"
done

echo "Extensiones instaladas."
