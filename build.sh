#!/bin/bash
set -eo pipefail

work() {
  local version="$1"; shift
  local tag="caninjas/jdk$version"
  sed "s/__JAVA_VERSION__/$version/g" Dockerfile.template > Dockerfile
  docker build -t "$tag" .
  docker push "$tag"
  rm -rf Dockerfile
}

for jdk in 7 8; do
  work "$jdk"
done
