FROM ubuntu:20.04
MAINTAINER sameerkanade2001@gmail.com

# Install Apache and necessary tools
RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean

# Download and extract the Fonicy template from a working source
RUN wget -O /tmp/fonicy.zip https://github.com/templatemo/fonicy/archive/refs/heads/main.zip && \
    unzip /tmp/fonicy.zip -d /tmp/ && \
    cp -r /tmp/fonicy-main/* /var/www/html/ && \
    rm -rf /tmp/fonicy.zip /tmp/fonicy-main

# Set the working directory
WORKDIR /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
