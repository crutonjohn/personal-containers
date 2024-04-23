#!/usr/bin/env bash
version=$(curl -sX GET https://gitlab.com/api/v4/projects/19217373/releases | jq '.[]' | jq -r '.tag_name' | head -1)
printf "%s" "${version}"
