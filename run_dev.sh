#!/bin/bash
DEV_POUSSETACHES_AUTH_KEY="1234567890"
MICROBLOGPUB_INTERNAL_HOST="http://host.docker.internal:5005"


env POUSSETACHES_AUTH_KEY=${DEV_POUSSETACHES_AUTH_KEY} docker-compose -f docker-compose-dev.yml up -d
FLASK_DEBUG=1 MICROBLOGPUB_DEBUG=1 FLASK_APP=app.py POUSSETACHES_AUTH_KEY=${DEV_POUSSETACHES_AUTH_KEY} MICROBLOGPUB_INTERNAL_HOST=${MICROBLOGPUB_INTERNAL_HOST} flask run -p 5005 --with-threads
docker-compose down