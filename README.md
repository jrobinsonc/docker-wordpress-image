# Docker WordPress Image

Docker image designed to run a WordPress site.  
<https://hub.docker.com/r/jrobinsonc/wordpress/>

The image is based on CentOS.

## Includes

* PHP v7.2
* Composer
* WP-CLI

## How to use

This image is an environment designed to perfectly run a WordPress site, but does not come with the installation files for the CMS. I think you should be able to define the installation of your website using either [composer](https://getcomposer.org/), [WP-CLI](https://wp-cli.org/) or the traditional way (manually downloading the files).

**Start the container:**

```shell
docker run -d \
  --name wp \
  -p 80:80 \
  -p 443:443 \
  -v $(pwd):/var/www/html \
  jrobinsonc/wordpress
```

### Snippets

I create a directory to put snippets on how to use and implement this image. The directory is `./snippets`.

### About the SSL Certificate

This image comes with a self-signed certificate (located at `./conf/ssl`) that can be imported into your computer in order to avoid the SSL warning in the browser every time you access the website using `https://`.

Doc soon on how to do the import.

## License

Released under the [MIT license](https://raw.githubusercontent.com/jrobinsonc/docker-wordpress/master/LICENSE).
