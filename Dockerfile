FROM ubuntu:20.04
MAINTAINER sameerkanade2001@gmail.com
ENV DEBIAN_FRONTEND=noninteractive TZ=Asia/Kolkata

# Install Apache, zip, unzip — add apt update first!
RUN apt update && \
    apt install -y apache2 zip unzip && \
    apt clean

# Add the template ZIP file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Unzip and move content
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Run Apache in foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
