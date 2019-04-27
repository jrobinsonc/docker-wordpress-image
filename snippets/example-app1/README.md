# Example App 1

This can be used as example to implement the [WordPress docker image](https://hub.docker.com/r/jrobinsonc/wordpress/) of this repo.

> ⚠️ BE AWARE: The `docker-compose.yml` file is using the default ports for Apache (80 and 443) and MySQL (3306), and that configuration may conflict with other services in your computer using those ports. If that is the case, you should go and change it to something else.

## How to use

The source code of your app should be placed into the directory `./app`. Then you can follow the next commands.

**Start the containers**  

The command below should be run just the first time; this will download the needed images and, create and start the containers.

```shell
docker-compose up -d
```

After the command above, you should have both containers running, and should be able to open <http://localhost>.

After the first time, to start the containers again you should run:

```shell
docker-compose start
```

**Stop the containers**

```shell
docker-compose stop
```

**Remove the containers and its volumes**

```shell
docker-compose down -v
```

**For more help** about `docker-compose`, please visit the [reference page](https://docs.docker.com/compose/reference/overview/).