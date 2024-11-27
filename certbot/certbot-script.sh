#!/bin/bash

DOMAIN="mailpit.example.com"
EMAIL="youremail@example.com" # Ersetze durch deine E-Mail-Adresse

docker-compose run --rm certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email $EMAIL \
  --agree-tos \
  --no-eff-email \
  -d $DOMAIN
