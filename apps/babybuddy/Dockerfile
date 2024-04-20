FROM ghcr.io/onedr0p/alpine:rolling@sha256:3fbc581cb0fe29830376161ae026e2a765dcc11e1747477fe9ebf155720b8638

ARG CHANNEL

ENV \
    BABYBUDDY__RELEASE="${CHANNEL}"

#hadolint ignore=DL3018
RUN \
  apk add --no-cache --virtual=build-dependencies \
    build-base \
    jpeg-dev \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    mariadb-dev \
    postgresql-dev \
    python3-dev \
    zlib-dev && \
  apk add --no-cache \
    jpeg \
    libffi \
    libpq \
    libxml2 \
    libxslt \
    libpq-dev \
    openjpeg-dev \
    mariadb-connector-c \
    sqlite-libs \
    uwsgi \
    python3 \
    py3-pip \
    py3-setuptools \
    uwsgi-python3 && \
  chown -R kah:kah /app

USER kah

RUN \
  mkdir -p /app/tmp && \
  mkdir -p /app/www/babybuddy/public && \
  curl \
    -o /app/tmp/babybuddy.tar.gz \
    -L "https://github.com/babybuddy/babybuddy/archive/refs/tags/${BABYBUDDY__RELEASE}.tar.gz" && \
  tar xf \
    /app/tmp/babybuddy.tar.gz \
    -C /app/www/babybuddy/public \
    --strip-components=1 && \
  cd /app/www/babybuddy/public && \
  python3 -m venv /app/.kahpy && \
  . /app/.kahpy/bin/activate && \
  pip install --no-cache-dir \
    pip \
    wheel \
    mysqlclient && \
  pip install --no-cache-dir \
    -r requirements.txt && \
  rm -rf /app/tmp

EXPOSE 9090

#COPY ./apps/babybuddy/uwsgi.ini.tmpl /app/uwsgi.ini.tmpl
COPY ./uwsgi.ini.tmpl /app/uwsgi.ini.tmpl
#COPY ./apps/babybuddy/entrypoint.sh /entrypoint.sh
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/babybuddy/babybuddy"
