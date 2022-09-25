#!/usr/bin/with-contenv bashio
CONFIG_PATH=/data/options.json

export MQTT_SERVER="$(jq --raw-output '.mqtt_server' $CONFIG_PATH)"
export MQTT_USER="$(jq --raw-output '.mqtt_user' $CONFIG_PATH)"
export MQTT_PASS="$(jq --raw-output '.mqtt_pass' $CONFIG_PATH)"
export MQTT_CLIENT_ID="$(jq --raw-output '.mqtt_client_id' $CONFIG_PATH)"
export MQTT_DISCOVERY_PREFIX="$(jq --raw-output '.mqtt_discovery_prefix' $CONFIG_PATH)"
export DEBUG="$(jq --raw-output '.debug' $CONFIG_PATH)"

echo "Starting local server to listen growatt dataloggers on port 5279"

perl ./Growatt-server/growatt_server.pl --debug=$DEBUG