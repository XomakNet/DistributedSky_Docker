#!/bin/bash
source /opt/ros_ws/distributed_sky/devel/setup.bash
rostopic echo /rosout_agg | grep -E "msg: .*"
