#!/bin/sh

VESCPP="../src/explorer_ws/explorer_stack/libs/orthopus_vesc/lib/vescpp/build/"

cd "$VESCPP"

can_port=""
ids=""
if [ -z "$1" -o "$1" = "bench" ]; then
  echo "Config: Bench"
  can_port="can0"
  ids=`seq 11 16`
  if [ $# -ge 1 ]; then
	shift;
  fi
elif [ -z "$1" -o "$1" = "all" ]; then
  echo "Config: All"
  can_port="can0"
  ids=`seq 1 254`
  if [ $# -ge 1 ]; then
	shift;
  fi
elif [ "$1" = "explorer" ]; then
  echo "Config: Explorer"
  can_port="can2"
  ids=`seq 11 16`
  shift
else
  echo "Usage: $0 [explorer|bench] <cmd>. Abort"
  exit 0
fi

cmd_base="./cli/vescpp_cli -P $can_port"
proxy_cmd="$*"
for i in $ids; do 
    cmd="$cmd_base -i $i proxy $proxy_cmd"
    echo $cmd
    $cmd;
    sleep 1
done
