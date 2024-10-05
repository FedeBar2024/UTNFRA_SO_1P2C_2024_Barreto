#! /bin/bash

echo "creo las particiones"
sudo fdisk /dev/sdc <<EOF
n
e



n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
w
EOF

echo "mostrar particionamiento"
sudo fdisk /dev/sdc -l

echo "formateo las particiones"
for i in {1..10}; do
    sudo mkfs.ext4 /dev/sdc$i
done

echo"monto forma persiste las carpetas del punto A"
echo "/dev/sdc &HOME/Punto_A ext4 defaults 0 0" | sudo tee -a

