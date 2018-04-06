cmake_minimum_required(VERSION 2.8.3)
project(dsky_main)

find_package(catkin REQUIRED)


install(
    FILES
        launch/test.launch
    DESTINATION
        ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)
