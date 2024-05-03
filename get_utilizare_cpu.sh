#!/usr/bin/env bash

avg_values=$(cat /proc/loadavg | cut -d " " -f 1,2,3)
nr_processors=$(cat /proc/cpuinfo | grep "core id" | wc -l)

echo -e "Values:${avg_values}\nCores:${nr_processors}"