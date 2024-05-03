#!/usr/bin/env bash

lscpu | grep "Model name" | tr -s " " | cut -d ":" -f 2 | cut -d " " -f 2,3,4