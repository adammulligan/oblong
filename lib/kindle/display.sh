#!/bin/sh

cd "$(dirname "$0")"

rm output.png

if wget -O output.png http://192.168.0.20:4000/image/index; then
  eips -c
  eips -c
  eips -g output.png
else
  eips -g error.png
fi
