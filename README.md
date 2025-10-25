# Pagina Web BMW Con Opcion De Script De Automatización
Este proyecto corresponde a mi trabajo final de la asignatura de Telemática. Consiste en una página web sencilla donde presento los vehículos que más me gustan actualmente, enfocados en las nuevas generaciones G y LCI de BMW. En ella se muestran algunos detalles relevantes de cada modelo.

En este archivo README se describen los aspectos más importantes del desarrollo del proyecto, incluyendo el funcionamiento del archivo DockerFile para quienes deseen ejecutarlo sin utilizar el script. Asimismo, se incluye una breve guía sobre cómo emplear dicho script en caso de preferir una instalación rápida y visualizar directamente la página web.

---

# Estructura del proyecto
bmw-web/

├── index.html

├── style.css

├── Dockerfile

├── deploy.sh

└── README.md

## 🐳 Dockerfile

El proyecto incluye un `Dockerfile` que define cómo se construye la imagen del sitio.

```Dockerfile 
# Imagen base ligera con Nginx (servidor web)
FROM nginx:alpine

# Copiar los archivos del proyecto al directorio público de Nginx
COPY . /usr/share/nginx/html

# Exponer el puerto 80 para el tráfico HTTP
EXPOSE 80

# El contenedor iniciará automáticamente Nginx

```
# Como Utilizar Script
Antes de poder generar todo automaticamente usted debera utilizar los siguientes comandos:
```
git clone https://github.com/SRT-D/bmw-web.git
cd bmw-web
```
Luego para darle permisos al Script creado y ejecutarlo
```
chmod +x deploy.sh
./deploy.sh
```
Ahora para ver la pagina web tienes dos opciones, la primera es si estas desde una instancia donde deberas colocar en tu navegador: ```http://<IP_PUBLICA_DE_TU_SERVIDOR>``` o si estas en tu pc local colocar:``` http://localhost:8080```



