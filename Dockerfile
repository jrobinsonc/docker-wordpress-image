FROM centos:7

# Setup the Remi YUM repo:
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum-config-manager --enable remi-php72

# Updating packages and installing basic stuff
RUN yum update -y \
    && yum install -y curl vim git unzip nmap-ncat

# Installing server stuff
RUN yum install -y httpd mod_ssl mariadb \
    && yum install -y php php-mysql php-opcache php-xml php-gd php-mbstring php-openssl php-curl php-json php-pdo php-hash php-date php-dom php-filter php-pcre php-session php-simplexml php-spl php-tokenizer php-xdebug php-posix php-zip

# Installing Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

# Installing WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# UTC Timezone & Networking
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
    && echo "NETWORKING=yes" > /etc/sysconfig/network

EXPOSE 80 443

COPY conf/php.ini /etc/php.d/wordpress.ini
COPY conf/httpd.conf /etc/httpd/conf.d/wordpress.conf
RUN mkdir /var/www/logs

COPY conf/ssl/localhost.crt /etc/pki/tls/certs/localhost.crt
COPY conf/ssl/localhost.key /etc/pki/tls/private/localhost.key

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

WORKDIR /var/www/html

# Cleaning the room
RUN rm -rf /var/cache/yum/* \
    && yum clean all

ENTRYPOINT ["/root/entrypoint.sh"]
