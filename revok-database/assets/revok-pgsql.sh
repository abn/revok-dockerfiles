#!/usr/bin/env bash

REVOK_USER=${REVOK_USER-revok}
REVOK_DB=${REVOK_DB-revok_db}
REVOK_DB_PWFILE=${PGHOME-$(pwd)}/revok.pwfile

# inject a random password if ${REVOK_DB_PWFILE} is not available and 
# REVOK_PASS is not provided in the environment
if [ ! -f ${REVOK_DB_PWFILE} ] && [ -z ${REVOK_PASS} ]; then
    REVOK_PASS=$(pwgen -c -n -1 14)
    echo "${REVOK_PASS}" > ${REVOK_DB_PWFILE}
else
    REVOK_PASS=${REVOK_PASS-$(cat ${REVOK_DB_PWFILE})}
fi

# create revok user if not found
{ psql --command "SELECT 'FOUND' FROM pg_roles WHERE rolname='${REVOK_USER}'" \
        | grep "FOUND" > /dev/null 2>&1; } \
    || { psql --command "CREATE USER ${REVOK_USER} WITH PASSWORD '${REVOK_PASS}';" \
        && echo "Created PGSQL user: ${REVOK_USER}"; }

# create the revok database
#/bin/createdb --owner ${REVOK_USER} ${REVOK_DB} > /dev/null 2>&1 \
psql --command "CREATE DATABASE ${REVOK_DB} OWNER ${REVOK_USER};" \
    && echo "Created PGSQL database: ${REVOK_DB}";

psql \
    --dbname=${REVOK_DB} \
    --echo-all \
    --file=${POST_INIT}/revok.sql

psql \
    --dbname=${REVOK_DB} \
    --command "ALTER TABLE runcases OWNER TO ${REVOK_USER};"

echo "host ${REVOK_DB} ${REVOK_USER} 0.0.0.0/0 md5" >> ${PGDATA}/pg_hba.conf
echo "listen_addresses = '*'" >> ${PGDATA}/postgresql.conf
