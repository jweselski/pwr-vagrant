FROM bunchjesse/php7.0-apache2

COPY laravel /web/public/laravel

RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev \
  && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt

RUN cd /web/public/laravel && cp .env.example .env && composer install && chmod 777 -R storage && php artisan key:generate
