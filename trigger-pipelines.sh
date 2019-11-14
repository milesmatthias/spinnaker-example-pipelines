#!/usr/bin/env bash

GATE_ENDPOINT=${GATE_ENDPOINT:-"http://localhost:8084"}
SPIN="spin --gate-endpoint ${GATE_ENDPOINT}"

triggers=20
pause=1

i=0

while [ $i -lt $triggers ]; do

  for dir in */ ; do
		dir=${dir%*/} 

		echo "triggering ${dir}..."
    $SPIN pipeline execute --application ${dir} --name ${dir}
  done

  sleep $pause
  i=$((i + 1))
done
