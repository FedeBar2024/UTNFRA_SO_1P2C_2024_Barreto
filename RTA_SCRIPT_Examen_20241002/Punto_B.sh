#!/bin/bash

# Definición de la ruta del disco que será particionado
DISCO="/dev/sdc" # Disco de 10GB para particiones

echo "Iniciando la creación de la partición extendida..."
echo

# Utilizo un Here Document para enviar comandos a fdisk y crear la partición extendida.
sudo fdisk $DISCO << EOF
n
e



w
EOF

echo
echo "Procediendo con el particionamiento..."

# Implemento un bucle FOR para generar particiones lógicas dentro de la partición extendida.
# Este bucle crea 10 particiones de 900MB cada una.
for i in {1..10}
do
    echo "Generando la partición lógica número $i..."
    echo
    sudo fdisk $DISCO << EOF
n
l

+900M
w
EOF
done
echo
echo '¡Excelente, el proceso fue exitoso!'

echo
# Actualizo la tabla de particiones sin necesidad de reiniciar la máquina virtual.
sudo partprobe $DISCO

echo
echo "Formateando las particiones..."
for j in {5..14} # Las particiones 5 a 14 corresponden a las lógicas creadas.
do
    echo 'Formateando partición...'
    echo
    sudo mkfs.ext4 ${DISCO}$j
done
echo 'El formateo de las particiones se completó con éxito, ¡impresionante!'

echo
echo 'Preparando el montaje persistente de las particiones...'
echo
# Capturo el UUID de cada partición y lo añado al archivo fstab para el montaje automático.

for k in {5..14}; do
    echo "$(sudo lsblk -no UUID ${DISCO}$k) /Examenes-UTN/alumno_$(( (k-5)/3 + 1 ))/parcial_$(( (k-5)%3 + 1 )) ext4 defaults 0 2" | sudo tee -a /etc/fstab
done

echo
echo "Mostrando las particiones montadas:"
sudo df -h
lsblk -f /dev/sdc

echo
echo "El script de creación, formateo y montaje persistente."
