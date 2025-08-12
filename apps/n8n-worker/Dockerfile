ARG VERSION
FROM n8nio/n8n:${VERSION}

USER root

RUN apk add --no-cache \
    ffmpeg \
    ffmpeg-dev \
    && rm -rf /var/cache/apk/*

USER node
