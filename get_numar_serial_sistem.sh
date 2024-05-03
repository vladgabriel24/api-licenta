#!/usr/bin/env bash

echo "$1" | sudo -S cat /sys/class/dmi/id/product_serial
