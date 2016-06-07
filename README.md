# Dummy Certification Authority
A quick and dirty way for creating a Root Certification Authority (CA) and one Intermediate CA for testing.

## Build
```
git clone https://github.com/asasfu/dummy_ca.git
```
Create a shell file in the parent dir or modify the CD section, name it run_dummy_ca.sh
```
#!/usr/bin/env bash

export countryName='<2 letter country name>'
export stateOrProvinceName='<full state or province name>'
export localityName='<city name>'
export organizationName='<organization name>'
export organizationalUnitName='<unit name>'
export commonName='<hostname for your CA>'
export emailAddress='<email addy to list as mgmt of CA>'
export crl_addr='<crl addr for vault>'
export crl_port='<crl port for vault>'
export pki_root='<pki root(mountpoint in vault, base is pki, but any name can be used)>'

(cd dummy_ca && ./pre_build.sh)
```

Run that shell file with your encryption password for the cert keyfiles via:
```
ca_pas=<passphrase> bash run_dummy_ca.sh
```

If you would prefer not to submit the passphrase in the command line, the script will request the passphrase from you via stdin once.

The intermediate bundle will exist in /tmp/vault/ca_bundle.pem which you will then follow the blog to import into vault pki


Yep, that easy!

## Credits
Reading [Jamie's Blog](https://jamielinux.com/docs/openssl-certificate-authority/) is a must!

Made with ♥️ by [kintoandar](https://blog.kintoandar.com)

Related page at [vault-PKI-made-easy](https://blog.kintoandar.com/2015/11/vault-PKI-made-easy.html)
