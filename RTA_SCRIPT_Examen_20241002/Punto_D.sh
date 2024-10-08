#!/bin/bash

# Crear el directorio principal
mkdir -p ~/Estructura_Asimetrica

# Crear las carpetas correo y clientes
mkdir -p ~/Estructura_Asimetrica/correo
mkdir -p ~/Estructura_Asimetrica/clientes

# Crear cartas_ del 1 al 100 en ambas carpetas
for i in {1..100}; do
    echo "" > ~/Estructura_Asimetrica/correo/carta_$i
    echo "" > ~/Estructura_Asimetrica/clientes/carta_$i
done

# Crear carteros_ del 1 al 10 solo en la carpeta correo
for i in {1..10}; do
    echo "" > ~/Estructura_Asimetrica/correo/cartero_$i
done

# Mostrar la estructura de manera simple
echo "Estructura_Asimetrica:"
tree ~/Estructura_Asimetrica/

