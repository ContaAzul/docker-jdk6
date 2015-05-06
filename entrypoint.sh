#!/bin/bash
set -eo pipefail
service postgresql start
update-java-alternatives -s java-${JAVA_VERSION}-oracle
exec "$@"
