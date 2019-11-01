FROM php:7.3-fpm

MAINTAINER Mehrdad Dadkhah <mehrdad@dadkhah.me>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        g++ \
        libicu-dev \
        libxml2-dev \
        git \
        vim \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libzip-dev \
        libmagickwand-dev --no-install-recommends \
    && docker-php-ext-configure intl \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install xml \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install soap \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && pecl install imagick  \
    && docker-php-ext-enable imagick \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && pecl install xdebug \
    && apt-get purge --auto-remove -y g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN sed -i -e 's/listen.*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

CMD ["php-fpm"]
