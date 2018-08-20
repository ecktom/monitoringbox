#!/bin/bash

## Check for Parameters
if [ -z ${INFLUXDB_DB+x} ]; then echo "INFLUXDB_DB not set"; export INFLUXDB_DB=; fi
if [ -z ${INFLUXDB_HTTP_AUTH_ENABLED+x} ]; then echo "INFLUXDB_HTTP_AUTH_ENABLED not set"; export INFLUXDB_HTTP_AUTH_ENABLED=false; fi
if [ -z ${INFLUXDB_ADMIN_USER+x} ]; then echo "INFLUXDB_ADMIN_USER not set"; export INFLUXDB_ADMIN_USER=; fi
if [ -z ${INFLUXDB_ADMIN_PASSWORD+x} ]; then echo "INFLUXDB_ADMIN_PASSWORD not set"; export INFLUXDB_ADMIN_PASSWORD=; fi
if [ -z ${INFLUXDB_USER+x} ]; then echo "INFLUXDB_USER not set"; export INFLUXDB_USER=; fi
if [ -z ${INFLUXDB_USER_PASSWORD+x} ]; then echo "INFLUXDB_USER_PASSWORD not set"; export INFLUXDB_USER_PASSWORD=; fi

## Build custom File
export configFile="/etc/grafana/provisioning/datasources/datasource.yaml";
sed -i -e "s/%INFLUXDB_DB%/${INFLUXDB_DB}/g" ${configFile};
sed -i -e "s/%INFLUXDB_HTTP_AUTH_ENABLED%/${INFLUXDB_HTTP_AUTH_ENABLED}/g" ${configFile};
sed -i -e "s/%INFLUXDB_ADMIN_USER%/${INFLUXDB_ADMIN_USER}/g" ${configFile};
sed -i -e "s/%INFLUXDB_ADMIN_PASSWORD%/${INFLUXDB_ADMIN_PASSWORD}/g" ${configFile};
sed -i -e "s/%INFLUXDB_USER%/${INFLUXDB_USER}/g" ${configFile};
sed -i -e "s/%INFLUXDB_USER_PASSWORD%/${INFLUXDB_USER_PASSWORD}/g" ${configFile};

/run.sh