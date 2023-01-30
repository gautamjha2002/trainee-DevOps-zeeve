#!/bin/bash

# Define the webhook URL for Slack
WEBHOOK_URL=https://hooks.slack.com/services/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

# Checking RAM usage
RAM_USAGE=$(free | awk '/Mem:/{printf("%.0f\n", $3/$2*100)}')
if [[ $RAM_USAGE -gt 90 ]]; then
  curl -H "Content-Type: application/json" -X POST --data "{\"text\":\"RAM usage is over 90%: $RAM_USAGE%\"}" $WEBHOOK_URL
fi

# Checking storage usage
STORAGE_USAGE=$(df / | awk '{print $5}' | grep -Eo "[0-9]+")
if [[ $STORAGE_USAGE -gt 95 ]]; then
  curl -H "Content-Type: application/json" -X POST --data "{\"text\":\"Storage usage is over 95%: $STORAGE_USAGE%\"}" $WEBHOOK_URL
fi
