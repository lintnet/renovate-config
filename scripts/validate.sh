#!/usr/bin/env bash

set -euo pipefail

ls | grep .json | while read -r file; do
    if [ -f "$file" ]; then
        RENOVATE_CONFIG_FILE="$file" npx --package renovate -c renovate-config-validator
    fi
done
