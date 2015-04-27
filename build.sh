#!/bin/bash
set -eo pipefail

work() {
  local version="$1"; shift
  local tag="caninjas/jdk$version"
  sed "s/__JAVA_VERSION__/$version/g" Dockerfile.template > Dockerfile
  docker build -t "$tag" .
  [[ "${PUSH:-}" ]] && docker push "$tag"
  rm -rf Dockerfile
}

[ "$1" = "-p" ] && export PUSH="1"
for jdk in 6 7 8; do
  work "$jdk"
done
