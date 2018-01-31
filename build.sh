#!/usr/bin/env bash

repository="realpage/fpm-nginx"
fpm=( "7.2.1" "7.2" "7" )
tagsfpm=""

echo "Building tags for fpm images"
for version in "${fpm[@]}"; do
  tagsfpm="${tagsfpm} -t ${repository}:${version}"
done

echo "Building base fpm images: ${tagsfpm}"
docker build ${tagsfpm} .
docker images

for version in "${fpm[@]}"; do
  echo "Pushing ${repository}:${version}...";
  docker push ${repository}:${version}
done
