#!/usr/bin/env bash

cron_schedule="* * * * *"
curl_command="curl -X POST http://$2:8080/load-db"

# Verificam exista lockfile-ul
lock=$(ls -al / | grep monitoring_lockfile)

if [ -z "$lock" ]; then

    echo "$cron_schedule $curl_command" >> /tmp/my_cron_job

    crontab /tmp/my_cron_job

    rm /tmp/my_cron_job

    echo "$1" | sudo -S touch /monitoring_lockfile

    echo "The data has started to be sent to the database"
else
    echo "The data is already sending to the database"
fi
