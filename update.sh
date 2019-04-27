#!/usr/bin/env bash
set -Eeuo pipefail

generate-dockerfile() {
  local java_vendor="$1"; shift
  local java_version="$1"; shift

  mkdir -p $java_vendor/$java_version
 
  sed "1s#java_vendor#$java_vendor#" Dockerfile.template > $java_vendor/$java_version/Dockerfile
  sed "1s#java_version#$java_version#" Dockerfile.template > $java_vendor/$java_version/Dockerfile
}

# Generate Dockerfile
generate-dockerfile openjdk 8-jre-alpine
generate-dockerfile frolvlad/alpine-oraclejre8 latest
