#!/bin/bash

ARCHIVO="$HOME/repogit/UTNFRA_SO_1P2C_2024_Barreto/RTA_ARCHIVOS_Examen_20241005/Filtro_Basico.txt"

mkdir -p "$(dirname "$ARCHIVO")"

RAM=$(grep 'MemTotal' /proc/meminfo)

FABRICANTE=$(sudo dmidecode -t chassis | grep 'Manufacturer:')

echo "$RAM" > "$ARCHIVO"
echo "$FABRICANTE" >> "$ARCHIVO"

echo "Se ha guardado con exito la informacion en Filtro Basico"

