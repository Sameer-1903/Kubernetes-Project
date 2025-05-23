FROM ubuntu:20.04
MAINTAINER sameerkanade2001@gmail.com
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 wget unzip && \
    apt-get clean

# ✅ Delete the Apache default page
RUN rm -f /var/www/html/index.html

# ✅ Download and install template
RUN wget -O /tmp/sample-template.zip https://github.com/BlackrockDigital/startbootstrap-agency/archive/refs/heads/master.zip && \
    unzip /tmp/sample-template.zip -d /tmp/ && \
    cp -r /tmp/startbootstrap-agency-master/* /var/www/html/ && \
    rm -rf /tmp/sample-template.zip /tmp/startbootstrap-agency-master

WORKDIR /var/www/html/

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
