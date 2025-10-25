#!/bin/bash
# ------------------------------------------------------
# Script de despliegue automático - BMW Web
# Autor: Daniel Benitez
# Fecha: Octubre 2025
# ------------------------------------------------------

echo "🚀 Iniciando despliegue automático de BMW Web..."

# 1️⃣ Verificar si Docker está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Instalando..."
    sudo apt update
    sudo apt install docker.io -y
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# 2️⃣ Construir la imagen Docker
echo "Construyendo imagen Docker."
sudo docker build -t bmw-web .

# 3️⃣ Detener contenedor previo si existe
if [ "$(sudo docker ps -q -f name=bmw-web)" ]; then
    echo "Deteniendo contenedor anterior."
    sudo docker stop bmw-web
fi

# 4️⃣ Eliminar contenedor previo si existe
if [ "$(sudo docker ps -aq -f status=exited -f name=bmw-web)" ]; then
    echo "Eliminando contenedor anterior."
    sudo docker rm bmw-web
fi

# 5️⃣ Ejecutar nuevo contenedor
echo "Iniciando nuevo contenedor"
sudo docker run -d --name bmw-web -p 80:80 bmw-web

# 6️⃣ Mostrar estado final
echo "Despliegue completado exitosamente."
sudo docker ps | grep bmw-web
echo "🌐 Accede a la pagina en: http://<TU_IP_PUBLICA> o si lo realizaste en tu PC local con http://localhost:8080"
