#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/ros2_ws/install/setup.bash

timeout 10 ros2 run mypkg talker &
timeout 10 ros2 run mypkg listener > /tmp/mypkg.log

cat /tmp/mypkg.log | grep 'Listen: 10'
