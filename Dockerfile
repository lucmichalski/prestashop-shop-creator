FROM php:7.2-fpm-alpine
Maintainer Michalski Luc <michalski.luc@gmail.com>

RUN apk --no-cache add \
    bash \
    git \
    ca-certificates 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY . /opt
WORKDIR /opt

RUN composer install

VOLUME ["/opt/app/config"] 

RUN cat /opt/app/config/config.yml

# ENTRYPOINT 
CMD ["/usr/local/bin/php", "app/console.php"]
