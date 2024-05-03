#!/usr/bin/env bash

echo $(( $(cat /sys/class/net/$1/statistics/rx_dropped) + $(cat /sys/class/net/$1/statistics/tx_dropped) ))