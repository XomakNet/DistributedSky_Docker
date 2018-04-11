FROM robonomics-comm

# Distributed sky package
RUN apt-get install -y ros-lunar-geographic-msgs
WORKDIR /
RUN mkdir -p /opt/ros_ws/distributed_sky/src/
WORKDIR /opt/ros_ws/distributed_sky/src/
COPY distributed_sky .
RUN [ "/bin/bash", "-c", "source /opt/ros/lunar/setup.bash && catkin_init_workspace" ]
WORKDIR ../
RUN [ "/bin/bash", "-c", "source /opt/ros/lunar/setup.bash && source $WS_SOURCE_PATH && catkin_make" ]
ENV WS_SOURCE_PATH /opt/ros_ws/distributed_sky/devel/setup.bash

WORKDIR /
CMD [ "roslaunch", "dsky_main", "test.launch" ]
