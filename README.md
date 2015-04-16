# [docker-jdk6](https://registry.hub.docker.com/u/caninjas/jdk6/)

Docker image with Oracle JDK6, Maven 3.2.5 and Git. You can use it to
run that old project...

## Usage

To start a container, mapping your `~/.m2` and your java 6 project, run:

```bash
docker run \
  -v ~/.m2/:/root/.m2 \
  -v ~/projects/my-java-6-project:/src/project \
  -it caarlos0/jdk6 sh -c 'cd /src/project; exec "/bin/bash"'
```
