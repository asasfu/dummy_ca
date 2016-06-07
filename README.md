# Dummy Certification Authority
A quick and dirty way for creating a Root Certification Authority (CA) and one Intermediate CA for testing.

## Build
```
git clone https://github.com/asasfu/dummy_ca.git
Create a shell file in the parent dir or modify the CD section
contents: 
#!/bin/bash

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
Yep, that easy!

## Credits
Reading [Jamie's Blog](https://jamielinux.com/docs/openssl-certificate-authority/) is a must!

Made with ♥️ by [kintoandar](https://blog.kintoandar.com)
Related page at [vault-PKI-made-easy](https://blog.kintoandar.com/2015/11/vault-PKI-made-easy.html)
