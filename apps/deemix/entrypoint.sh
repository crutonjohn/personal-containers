#!/usr/bin/env bash

DEEMIX_DATA_DIR="$DEEMIX__DATA_DIR"
DEEMIX_MUSIC_DIR="$DEEMIX__MUSIC_DIR"
DEEMIX_HOST="$DEEMIX__HOST"
DEEMIX_PORT="$DEEMIX__PORT"

#shellcheck disable=SC2086
exec \
    /app/bin/deemix-server
