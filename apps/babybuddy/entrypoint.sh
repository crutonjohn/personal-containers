#!/usr/bin/env bash

#shellcheck disable=SC1091
test -f "/scripts/umask.sh" && source "/scripts/umask.sh"

# Update uwsgi config with environment variables
envsubst < /app/uwsgi.ini.tmpl > /config/uwsgi.ini

venv_path='/app/.kahpy'

source "${venv_path}/bin/activate"

#shellcheck disable=SC2086
cd /app/www/babybuddy/public && \

DJANGO_SETTINGS_MODULE="babybuddy.settings.base" \
ALLOWED_HOSTS="${ALLOWED_HOSTS:-*}" \
TIME_ZONE="${TZ:-UTC}" \
DEBUG="${DEBUG:-False}" \
SECRET_KEY="${SECRET_KEY:-$(cat /config/secretkey)}" \
python manage.py migrate && \

uwsgi --ini /config/uwsgi.ini
