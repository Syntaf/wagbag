#!/bin/bash
set -euo pipefail

# Remove a potentially pre-existing server.pid file for Rails
rm -f /opt/wagbag/tmp/pids/server.pid

# usage: file_env VAR [DEFAULT]
#    ie: file_env 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
file_env() {
	local var="$1"
	local fileVar="${var}_FILE"
	local def="${2:-}"
	if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
		echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
		exit 1
	fi
	local val="$def"
	if [ "${!var:-}" ]; then
		val="${!var}"
	elif [ "${!fileVar:-}" ]; then
		val="$(< "${!fileVar}")"
	fi
	export "$var"="$val"
	unset "$fileVar"
}

file_env 'POSTGRES_PASSWORD'
file_env 'TWILIO_ACCOUNT_SID'
file_env 'TWILIO_AUTH_TOKEN'
file_env 'TWILIO_PHONE_NUMBER'

# Exec main process
exec "$@"