FROM ubuntu:22.04

ENV timezone=America/Sao_Paulo
ENV php=php8.2

RUN apt update && \
    ln -snf /usr/share/zoneinfo/${timezone} /etc/localtime && echo ${timezone} > /etc/timezone && \
    apt install -y apache2 && \
    apt install -y libapache2-mod-php && \
    apt install -y software-properties-common && \
    apt install -y lsb-release && \
    apt install -y apt-transport-https && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt update && \
    apt install -y ${php}-opcache && \
    apt install -y ${php} && \
    apt install -y ${php}-cli && \
    apt install -y ${php}-common && \
    apt install -y ${php}-gd && \
    apt install -y ${php}-bcmath && \
    apt install -y ${php}-xdebug && \
    apt install -y ca-certificates && \
    apt install -y ${php}-mysql && \
    apt install -y ${php}-curl && \
    apt install -y ${php}-zip && \
    apt install -y ${php}-mbstring && \
    apt install -y ${php}-xml && \
    apt install -y zip && \
    apt install -y unzip && \
    apt install -y git && \
    apt install -y libpng-dev && \
    apt install -y libzip-dev && \
    apt install -y zlib1g-dev && \
    apt install -y ghostscript && \
    apt install -y curl && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && rm composer-setup.php && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer

RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
RUN chown -R root:www-data /var/www/html
RUN chmod u+rwx,g+rx,o+rx /var/www/html
RUN find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +
WORKDIR /var/www/html
RUN a2enmod rewrite
RUN a2enmod ssl
RUN rm -rf /var/www/html/index.html

EXPOSE 80
EXPOSE 443

CMD  [ "apachectl", "-D", "FOREGROUND"]
