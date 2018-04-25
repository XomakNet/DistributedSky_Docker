FROM robonomics-comm

# PIP requirements
RUN pip3 install --upgrade pip
COPY requirements.pip .
RUN pip3 install -r requirements.pip && rm requirements.pip

# Distributed sky package
RUN apt-get install -y ros-lunar-geographic-msgs
WORKDIR /
RUN mkdir -p /opt/ros_ws/distributed_sky/src/
WORKDIR /opt/ros_ws/distributed_sky/src/
COPY distributed_sky_ros .
RUN [ "/bin/bash", "-c", "source /opt/ros/lunar/setup.bash && catkin_init_workspace" ]
WORKDIR ../
RUN [ "/bin/bash", "-c", "source /opt/ros/lunar/setup.bash && source $WS_SOURCE_PATH && catkin_make" ]
ENV WS_SOURCE_PATH /opt/ros_ws/distributed_sky/devel/setup.bash

WORKDIR /

RUN echo "source $WS_SOURCE_PATH" > /root/.bashrc
CMD [ "roslaunch", "dsky_main", "test.launch" ]
