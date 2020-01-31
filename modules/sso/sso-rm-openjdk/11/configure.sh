#!/bin/sh
set -u
set -e

if ! rpm -q java-11-openj9-devel; then
  exit
fi

for pkg in java-11-openjdk-devel \
       java-11-openjdk-headless \
       java-11-openjdk; do
    if rpm -q "$pkg"; then
        rpm -e --nodeps "$pkg"
    fi
done
