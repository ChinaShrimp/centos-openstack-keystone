#!/bin/bash
set -x
# create database for keystone
export MYSQL_ROOT_PASSWORD=${MYSQL_ENV_MYSQL_ROOT_PASSWORD}
export MYSQL_HOST=${MYSQL_HOST:-mysql}
SQL_SCRIPT=/root/keystone.sql
mysql -uroot -p$MYSQL_ROOT_PASSWORD -h $MYSQL_HOST <$SQL_SCRIPT

/bin/bash
