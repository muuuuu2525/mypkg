#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"   # 引数があれば、それをホームディレクトリとして扱う

cd $dir/ros2_ws
colcon build                 # ワークスペースでビルド
source $dir/.bashrc          # 設定を読み込み

# ノードを10秒間実行し、ログを /tmp/mypkg.log に保存
# ※注意: ここで talk_listen.launch.py を使用しています
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

# ログの中に 'Listen: 10' があるか確認（あれば終了ステータス0＝成功）
cat /tmp/mypkg.log | grep 'Listen: 10'
