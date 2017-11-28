#!/bin/bash
source .env
while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' ${APP_URL})
  echo `date`" "${STATUS}
#  sleep 1
done
