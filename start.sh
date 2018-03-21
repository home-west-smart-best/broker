#!/bin/bash

# MQTT broker must be compiled for websocket protocol usage.

# mosquitto.cong must contain next lines:
# # Port to use for the default listener.
#   port 1883
#   listener 9001
#   protocol websockets
#

mosquitto -c config/mosquitto.conf

