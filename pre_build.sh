#!/usr/bin/env bash

if [ -z $ca_pas ]; then
  printf "Enter passphrase for key encryption: "
  read ca_pas_var
  export ca_pas=$ca_pas_var
fi
: "${ca_pas:?Need to set ca_pas non-empty}"
: "${countryName:?Need to set countryName non-empty}"
: "${stateOrProvinceName:?Need to set stateOrProvinceName non-empty}"
: "${localityName:?Need to set localityName non-empty}"
: "${organizationName:?Need to set organizationName non-empty}"
: "${organizationalUnitName:?Need to set organizationalUnitName non-empty}"
: "${commonName:?Need to set commonName non-empty}"
: "${emailAddress:?Need to set emailAddress non-empty}"
: "${crl_addr:?Need to set crl_addr non-empty}"
: "${crl_port:?Need to set crl_port non-empty}"
: "${pki_root:?Need to set pki_root non-empty}"

./build.sh \
  && cat $PWD/pki/intermediate/certs/intermediate.pem > /tmp/vault/ca_bundle.pem \
  && openssl rsa -passin env:ca_pas -in $PWD/pki/intermediate/private/intermediate.key >> /tmp/vault/ca_bundle.pem
