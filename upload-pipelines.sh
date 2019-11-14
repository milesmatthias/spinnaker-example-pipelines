#!/usr/bin/env bash

GATE_ENDPOINT=${GATE_ENDPOINT:-"http://localhost:8084"}
SPIN="spin --gate-endpoint ${GATE_ENDPOINT}"

for dir in */ ; do
  dir=${dir%*/} 

  $SPIN application save --application-name ${dir} \
    --owner-email foo@bar.com --cloud-providers kubernetes

  $SPIN pipeline save --file ${dir}/pipeline.json
done
