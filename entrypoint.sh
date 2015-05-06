#!/bin/bash
set -xeo pipefail
update-java-alternatives -s java-${JAVA_VERSION}-oracle
exec "$@"
