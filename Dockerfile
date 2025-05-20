FROM ubuntu:20.04
MAINTAINER sameerkanade2001@gmail.com
ENV DEBIAN_FRONTEND=noninteractive
# Install Apache and necessary tools
RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean

# Download and extract the Fonicy template
RUN wget -O /tmp/fonicy.zip https://www.free-css.com/assets/files/free-css-templates/download/page293/fonicy.zip && \
    unzip /tmp/fonicy.zip -d /var/www/html/ && \
    rm /tmp/fonicy.zip

# Set the working directory
WORKDIR /var/www/html/

# Expose ports
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
