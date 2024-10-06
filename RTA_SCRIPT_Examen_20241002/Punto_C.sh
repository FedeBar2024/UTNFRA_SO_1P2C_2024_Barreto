#!/bin/bash

PASSWORD="password"

# Crear grupos secundarios
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Crear usuarios y asignarles sus grupos secundarios
sudo useradd -m -G p1c2_2024_gAlumno p1c2_2024_A1
echo "p1c2_2024_A1:$PASSWORD" | sudo chpasswd

sudo useradd -m -G p1c2_2024_gAlumno p1c2_2024_A2
echo "p1c2_2024_A2:$PASSWORD" | sudo chpasswd

sudo useradd -m -G p1c2_2024_gAlumno p1c2_2024_A3
echo "p1c2_2024_A3:$PASSWORD" | sudo chpasswd

sudo useradd -m -G p1c2_2024_gProfesores p1c2_2024_P1
echo "p1c2_2024_P1:$PASSWORD" | sudo chpasswd

echo "Usuarios y grupos creados."

# Ajustar permisos para las carpetas y su contenido
# Carpeta de A1
sudo mkdir -p /home/p1c2_2024_A1/Examenes-UTN/alumno_1
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno /home/p1c2_2024_A1/Examenes-UTN/alumno_1
sudo chmod 770 /home/p1c2_2024_A1/Examenes-UTN/alumno_1

# Carpeta de A2
sudo mkdir -p /home/p1c2_2024_A2/Examenes-UTN/alumno_2
sudo chown p1c2_2024_A2:p1c2_2024_gAlumno /home/p1c2_2024_A2/Examenes-UTN/alumno_2
sudo chmod 700 /home/p1c2_2024_A2/Examenes-UTN/alumno_2

# Carpeta de A3
sudo mkdir -p /home/p1c2_2024_A3/Examenes-UTN/alumno_3
sudo chown p1c2_2024_A3:p1c2_2024_gAlumno /home/p1c2_2024_A3/Examenes-UTN/alumno_3
sudo chmod 770 /home/p1c2_2024_A3/Examenes-UTN/alumno_3

# Carpeta de Profesores
sudo mkdir -p /home/p1c2_2024_P1/Examenes-UTN/profesores
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /home/p1c2_2024_P1/Examenes-UTN/profesores
sudo chmod 775 /home/p1c2_2024_P1/Examenes-UTN/profesores

echo "Usuarios, grupos y permisos ajustados."

# Crear el archivo validar.txt en cada carpeta
echo "Creando validar.txt en las carpetas de cada usuario"

# Para alumno_1
echo "$(sudo -u p1c2_2024_A1 whoami)" | sudo tee /home/p1c2_2024_A1/Examenes-UTN/alumno_1/validar.txt

# Para alumno_2
echo "$(sudo -u p1c2_2024_A2 whoami)" | sudo tee /home/p1c2_2024_A2/Examenes-UTN/alumno_2/validar.txt

# Para alumno_3
echo "$(sudo -u p1c2_2024_A3 whoami)" | sudo tee /home/p1c2_2024_A3/Examenes-UTN/alumno_3/validar.txt

# Para profesores
echo "$(sudo -u p1c2_2024_P1 whoami)" | sudo tee /home/p1c2_2024_P1/Examenes-UTN/profesores/validar.txt

echo "Archivo validar.txt creado en las carpetas de cada usuario."
