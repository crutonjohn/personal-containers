ARG VERSION
FROM docker.io/library/golang:1.22-alpine as envsubst
ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""
ARG TARGETPLATFORM
ENV CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    GOARM=${TARGETVARIANT}
RUN go install -ldflags="-s -w" github.com/drone/envsubst/cmd/envsubst@latest

FROM docker.io/library/alpine:3.20

ARG TARGETPLATFORM
ARG VERSION

ENV \
    DEEMIX__VERSION="${VERSION}" \
    DEEMIX__PORT="6595" \
    DEEMIX__HOST="0.0.0.0" \
    DEEMIX__DATA_DIR="/config" \
    DEEMIX__MUSIC_DIR="/downloads"

ENV UMASK="0002" \
    TZ="Etc/UTC"

USER root
WORKDIR /app

#hadolint ignore=DL3018,DL3059
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        chromaprint \
        curl \
        icu-libs \
        jq \
        libintl \
        nano \
        tzdata \
    && \
    case "${TARGETPLATFORM}" in \
        'linux/amd64') export ARCH='amd64' ;; \
        'linux/arm64') export ARCH='arm64' ;; \
    esac \
    && \
    mkdir -p /app/bin \
    && \
    curl -fsSL "https://gitlab.com/api/v4/projects/19217373/packages/generic/${DEEMIX__VERSION}/${DEEMIX__VERSION}/deemix-server-linux-${ARCH}" -o /app/bin/deemix-server \
    && chown -R root:root /app \
    && chmod -R 755 /app \
    && rm -rf /tmp/*

COPY ./apps/deemix/entrypoint.sh /entrypoint.sh
COPY --from=envsubst /go/bin/envsubst /usr/local/bin/envsubst

ENTRYPOINT ["/usr/bin/catatonit", "--"]
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://gitlab.com/Bockiii/deemix-docker"
