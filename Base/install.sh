#!/bin/bash
set -xeo pipefail
echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install -y oracle-java${JAVA_VERSION}-installer
update-java-alternatives -s "java-${JAVA_VERSION}-oracle"
