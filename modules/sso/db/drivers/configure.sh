#!/bin/sh
# Link DB drivers, provided by RPM packages, into the "openshift" layer
set -e

SOURCES_DIR=/tmp/artifacts
SCRIPT_DIR=$(dirname $0)
ADDED_DIR=${SCRIPT_DIR}/added

function link {
  mkdir -p $(dirname $2)
  ln -s $1 $2
}

mkdir -p $JBOSS_HOME/modules/system/layers/openshift/org/mariadb/main/
cp "$SOURCES_DIR/mariadb-java-client.jar" $JBOSS_HOME/modules/system/layers/openshift/org/mariadb/main/mariadb-java-client.jar
link /usr/share/java/postgresql-jdbc.jar $JBOSS_HOME/modules/system/layers/openshift/org/postgresql/main/postgresql-jdbc.jar

# module definitions for MariaDB and PostgreSQL
# Remove any existing destination files first (which might be symlinks)
cp -rp --remove-destination "$ADDED_DIR/modules" "$JBOSS_HOME/"
