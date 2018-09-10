#!/bin/bash
set -e

gcloud init

curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
bash install-logging-agent.sh



exec "$@"

