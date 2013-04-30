#!/bin/sh

cd "$(dirname "$0")"

rm output.png

if wget -O output.png http://kindle.kobayashi.cyanoryx.com/image/index; then
  eips -c
  eips -c
  eips -g output.png
else
  eips -g error.png
fi
