FROM php:7.4-fpm-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN mkdir -p /var/www/

WORKDIR /var/www

RUN addgroup -g ${GID} --system docker
RUN adduser -G docker --system -D -s /bin/sh -u ${UID} docker

RUN sed -i "s/user = www-data/user = docker/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = docker/g" /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

RUN apk add --no-cache libpng libpng-dev zip libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install pdo pdo_mysql bcmath exif mysqli gd zip 
RUN apk del libpng-dev

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
