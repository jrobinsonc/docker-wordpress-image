# Based on
# https://make.wordpress.org/hosting/handbook/handbook/server-environment

FROM jrobinsonc/php:7.4-apache

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      # Needed by WP-CLI to do database stuff like import-export.
      mariadb-client \
      # Ghostscript is required for rendering PDF previews
      # https://make.wordpress.org/hosting/handbook/handbook/server-environment/#system-packages
      ghostscript \
      # Other stuff needed
      libfreetype6-dev \
      libjpeg-dev \
      libmagickwand-dev \
      libpng-dev \
      libzip-dev \
      libssh2-1-dev \
      libssh2-1 \
    ; \
    pecl install imagick-3.4.4; \
    pecl install ssh2-1.2; \
    rm -rf /var/lib/apt/lists/*;

# Installing packages and PHP extensions needed by WordPress.
# https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions
RUN set -eux; \
    docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr; \
    docker-php-ext-install -j "$(nproc)" \
      bcmath \
      exif \
      gd \
      mysqli \
      opcache \
      zip \
      sockets \
      opcache \
      exif \
    ; \
	  docker-php-ext-enable \
      imagick \
      ssh2 \
    ;

# Installing WP-CLI
# https://wp-cli.org/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# PHP settings for WordPress
COPY conf/php.ini-development /usr/local/etc/php/conf.d/wordpress.ini-development
COPY conf/php.ini-production /usr/local/etc/php/conf.d/wordpress.ini-production

RUN a2enmod rewrite expires headers
