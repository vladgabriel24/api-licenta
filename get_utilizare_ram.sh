#!/usr/bin/env bash

cat /proc/meminfo | grep -e "MemTotal" -e "MemAvailable" | tr -s " "