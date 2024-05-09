# Usa la imagen de Ubuntu como base
FROM ubuntu:latest

# Actualiza el sistema y instala Apache, PHP y Git
RUN apt-get update && \
    apt-get install -y apache2 php git

# Expone el puerto 80 para acceder a Apache
EXPOSE 80

# Elimina el contenido actual de /var/www/html
RUN rm -rf /var/www/html/*

# Descarga la aplicación web PHP desde un repositorio git y la copia al directorio de Apache
RUN git clone https://github.com/banago/simple-php-website.git /var/www/html

# Define el comando por defecto para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]

