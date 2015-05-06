#!/bin/bash
set -eo pipefail
[ "$PG" = "true" ] && service postgresql start
echo "$TZ" | sudo tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata
exec "$@"
