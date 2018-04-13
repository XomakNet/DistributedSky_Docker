#!/bin/bash
source "$WS_SOURCE_PATH"
rostopic echo /rosout_agg | grep -E "msg: .*"
