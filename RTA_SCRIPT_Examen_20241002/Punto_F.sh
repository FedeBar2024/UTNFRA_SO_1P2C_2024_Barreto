#!/bin/bash

ip_publica=$(curl -s ifconfig.me)

usuario=$(whoami)

hash_usuario=$(echo -n "$usuario" | sha256sum | awk '{print $1}')

url_repositorio=$(git remote get-url origin)

{
    echo "Mi IP Publica es: $ip_publica"
    echo "Mi usuario es: $usuario"
    echo "El Hash de mi Usuario es: $hash_usuario"
    echo "La URL de mi repositorio es: $url_repositorio"
} > "Filtro_Avanzado.txt"

echo "El archivo Filtro_Avanzado.txt ha sido generado"


