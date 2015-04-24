#!/bin/bash
set -eo pipefail
for jdk in 6 7 8; do
  make "$jdk"
done
for jdk in 6 7 8; do
  docker push "caninjas/jdk${jdk}"
done

