#!/bin/bash
set -e

if [ ! -d "/root/.ipfs" ]; then
	ipfs init
fi

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
source "$WS_SOURCE_PATH"
exec "$@"