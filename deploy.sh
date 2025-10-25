#!/bin/bash
# ------------------------------------------------------
# ------------------------------------------------------

echo "Iniciando el script"

if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Instalando..."
    sudo apt update
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
fi

echo "Construyendo imagen Docker..."
sudo docker build -t bmw-web .

if [ "$(sudo docker ps -q -f name=bmw-web)" ]; then
    echo "Deteniendo contenedor anterior."
    sudo docker stop bmw-web
fi

if [ "$(sudo docker ps -aq -f status=exited -f name=bmw-web)" ]; then
    echo "Eliminando contenedor anterior."
    sudo docker rm bmw-web
fi

echo "Iniciando nuevo contenedor"
sudo docker run -d --name bmw-web -p 80:80 bmw-web

echo "Despliegue completado exitosamente"
sudo docker ps | grep bmw-web
echo "Accede a la página en: http://<TU_IP_PUBLICA>"
