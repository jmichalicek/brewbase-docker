#!/usr/bin/env sh

if [ "$1" != "" ]; then
    environment = $1
else
    environment = "dev"
fi

if [ "$environment" == "dev"]; then
    dockerfile = "Dockerfile.dev"
    # For now, just unset all this stuff to ensure
    # no accidental putting real data into the image
    unset POSTGRES_DB
    unset POSTGRES_USER
    unset POSTGRES_PASSWORD
    unset DB_HOST
    unset SMTP_HOST
    unset SMTP_PORT
    unset SMTP_USERNAME
    unset SMTP_PASSWORD
fi

docker build -f Dockerfile.dev -t worrywort/worrywort:dev .
