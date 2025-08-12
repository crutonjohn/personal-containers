#!/usr/bin/env bash

export DEEMIX_DATA_DIR="$DEEMIX__DATA_DIR"
export DEEMIX_MUSIC_DIR="$DEEMIX__MUSIC_DIR"
export DEEMIX_HOST="$DEEMIX__HOST"
export DEEMIX_PORT="$DEEMIX__PORT"

# make sure directories exist
for DIRECTORY in $DEEMIX_DATA_DIR $DEEMIX_MUSIC_DIR
do
  if [ ! -d "$DIRECTORY" ]; then
    echo "Creating $DIRECTORY"
    mkdir -p $DIRECTORY
  fi
done

#shellcheck disable=SC2086
exec \
    /app/bin/deemix-server
