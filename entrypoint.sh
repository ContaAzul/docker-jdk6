#!/bin/bash
set -eo pipefail
update-java-alternatives -s "java-${JAVA_VERSION}-oracle"
service postgresql start
echo "$TZ" | sudo tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata
exec "$@"
