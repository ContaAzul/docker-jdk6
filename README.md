# [docker-jdk-pg](https://registry.hub.docker.com/u/caninjas/jdk-pg/)}

Docker images for Oracle JDK6, 7 or 8, with Maven 3.2.5, a permissive
PostgreSQL 9.3 and Git. It might be useful as a clean build environment.

## Usage

Just run:

```bash
$ docker run -e JAVA_VERSION=6 -it caninjas/jdk-pg /usr/bin/mvn -version
$ docker run -e JAVA_VERSION=7 -it caninjas/jdk-pg /usr/bin/mvn -version
$ docker run -e JAVA_VERSION=8 -it caninjas/jdk-pg /usr/bin/mvn -version
```
> JAVA_VERSION=8 is the default.
