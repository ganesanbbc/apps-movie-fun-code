#!/bin/bash

set -e +x

pushd movie-fun
  echo "Packaging JAR"
  mvn clean package -DskipTests
popd

binary_count=`find movie-fun/target -type f -name *.war | wc -l`

if [ $binary_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie-fun/target -type f -name *.war -exec cp "{}" package-output/moviefun.war \;

echo "Done packaging"

cf app moviefun
exit 0
