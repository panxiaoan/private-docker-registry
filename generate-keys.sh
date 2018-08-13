#!/bin/bash
openssl req \
    -new \
    -newkey rsa:4096 \
    -days 36500 \
    -subj "/CN=localhost" \
    -nodes \
    -x509 \
    -keyout conf/registry-web/auth.key \
    -out conf/registry/auth.cert
