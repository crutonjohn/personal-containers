#!/usr/bin/env bash

export DEEMIX_DATA_DIR="$DEEMIX__DATA_DIR"
export DEEMIX_MUSIC_DIR="$DEEMIX__MUSIC_DIR"
export DEEMIX_HOST="$DEEMIX__HOST"
export DEEMIX_PORT="$DEEMIX__PORT"

#shellcheck disable=SC2086
exec \
    /app/bin/deemix-server
