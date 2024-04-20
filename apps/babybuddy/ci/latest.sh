#!/usr/bin/env bash
version=$(curl -sX GET "https://api.github.com/repos/babybuddy/babybuddy/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]'); \)
printf "%s" "${version}"
