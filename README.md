# Docker WordPress Image

[![Build Status](https://travis-ci.org/jrobinsonc/docker-wordpress-image.svg?branch=master)](https://travis-ci.org/jrobinsonc/docker-wordpress-image)

<https://hub.docker.com/r/jrobinsonc/wordpress/>

## Includes

* PHP extensions required by WordPress.
* Composer
* WP-CLI

**Image Variants**

* PHP 7.2 with Apache → `jrobinsonc/wordpress:7.2-apache`
* PHP 7.3 with Apache → `jrobinsonc/wordpress:7.3-apache`
* PHP 7.4 with Apache → `jrobinsonc/wordpress:7.4-apache`

## How to use

**Start the container:**

```shell
docker run -d \
  -p 80:80 \
  -p 443:443 \
  -v $(pwd):/var/www/html \
  jrobinsonc/wordpress:7.3-apache
```
