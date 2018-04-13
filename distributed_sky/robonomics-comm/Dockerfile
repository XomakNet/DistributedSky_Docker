FROM ros:lunar-ros-base
RUN apt-get update && apt-get install -y python3 python3-pip wget

######################################### ONLY FOR DEVELOPMENT ########################################################### 
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN service ssh start
EXPOSE 22
######################################### ONLY FOR DEVELOPMENT ########################################################### 

# IPFS. Intentionally 0.4.13 version because of problems with pubsub in 0.4.14
WORKDIR /tmp
RUN wget https://dist.ipfs.io/go-ipfs/v0.4.13/go-ipfs_v0.4.13_linux-amd64.tar.gz
RUN tar xvfz go-ipfs_v0.4.13_linux-amd64.tar.gz && cd go-ipfs && ./install.sh && cd ../ && rm -R go-ipfs

# PIP requirements
RUN pip3 install --upgrade pip
COPY requirements.pip .
RUN pip3 install -r requirements.pip && rm requirements.pip

# Robonomics_comm
WORKDIR /
RUN mkdir -p /opt/ros_ws/aira_ws/src
WORKDIR /opt/ros_ws/aira_ws/src
COPY robonomics_comm .
RUN [ "/bin/bash", "-c", "source /opt/ros/lunar/setup.bash && catkin_init_workspace" ]
WORKDIR ../
RUN [ "/bin/bash", "-c", "source /opt/ros/lunar/setup.bash && catkin_make" ]
ENV WS_SOURCE_PATH /opt/ros_ws/aira_ws/devel/setup.bash

# Entry point
WORKDIR /

COPY read_log.sh .
RUN chmod +x ./read_log.sh

COPY ros_entrypoint.sh .
RUN chmod +x ros_entrypoint.sh
ENTRYPOINT [ "/ros_entrypoint.sh"]
