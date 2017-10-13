#!/bin/bash

apt-get update && apt-get install -y curl

set -ex

cf app moviefun

exit 0