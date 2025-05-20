FROM ubuntu:20.04
MAINTAINER sameerkanade2001@gmail.com

# Install apache2, unzip, zip
RUN apt update && \
    apt install -y apache2 unzip zip && \
    apt clean

# Download template zip and extract
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache in foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose only HTTP port
EXPOSE 80
