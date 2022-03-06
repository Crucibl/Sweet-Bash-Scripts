#!/bin/bash

if [ "$1" == "" ] ; then TIME=10 ; else TIME=$1 ; fi

echo -e "Going to sleep for $TIME seconds\n"
sleep $TIME
echo -e "I awoke after $TIME seconds\n"
