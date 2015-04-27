# docker-jdk{[6](https://registry.hub.docker.com/u/caninjas/jdk6/),[7](https://registry.hub.docker.com/u/caninjas/jdk7/),[8](https://registry.hub.docker.com/u/caninjas/jdk8/)}

Docker images for Oracle JDK6, 7 or 8, with Maven 3.2.5, a permissive
PostgreSQL and Git, usefull to use as a clean build environment.

## Usage

Just run:

```bash
$ docker run -it caninjas/jdk6 /bin/bash
$ docker run -it caninjas/jdk7 /bin/bash
$ docker run -it caninjas/jdk8 /bin/bash
```


## Build all images

```sh
./build
```

## Push all images

```sh
./build push
```
