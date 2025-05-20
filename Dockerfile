FROM ubuntu:20.04
MAINTAINER sameerkanade2001@gmail.com

# Avoid interactive prompts during build (like timezone config)
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, wget, zip, unzip
RUN apt-get update && \
    apt-get install -y apache2 wget zip unzip && \
    apt-get clean

# Download the PhotoGallery template from Colorlib
RUN wget -O /var/www/html/photogallery.zip https://colorlib.com/wp-content/uploads/sites/2/photogallery.zip

# Extract and move website content
WORKDIR /var/www/html/
RUN unzip photogallery.zip && \
    cp -rvf photogallery/* . && \
    rm -rf photogallery photogallery.zip

# Expose ports
EXPOSE 80 22

# Run Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
