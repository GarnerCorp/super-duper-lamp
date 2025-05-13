#!/bin/sh

set -x
ip addr list
hostname -i
python -m http.server 9001 &
sleep 2
curl -v \
  $(hostname -i):9001 \
  $(ip -4 addr list eth0 |perl -ne 'next unless m,inet ([^/]+),; print $1; last'):9001