#!/usr/bin/env bash
version=$(curl -sX GET https://api.github.com/repos/n8n-io/n8n/releases/latest | jq -r '.tag_name' | sed 's/^n8n@//g')
printf "%s" "${version}"
