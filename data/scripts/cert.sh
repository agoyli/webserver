#!/bin/bash

echo "!! SSL SERTIFICATE GENERATING SCRIPT STARTED !!"

if [ "$1" = "" ]; then
exit
fi

certbot --server https://acme-v02.api.letsencrypt.org/directory --cert-name $1 -d $1 -d "*.$1" --manual --preferred-challenges dns-01 certonly

