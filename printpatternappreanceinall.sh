#!/bin/sh
fruits_file=`cat fruits | grep -i ap*le | xargs`
echo "output: $fruits_file"

