# Backup Tools

Various backup tools for managing backups on your Linux server

### Install s3cmd

apt install python3 unzip
apt-get install python3-setuptools
cd tmp
wget https://github.com/s3tools/s3cmd/releases/download/v2.2.0/s3cmd-2.2.0.zip
unzip s3cmd-*.zip
cd s3cmd-*
python3 setup.py install
s3cmd --configure


### AWS

For aws you only need API access token and secret


### Digital Ocean

For digital ocean you need to change t he s3 endpoint and the bucket host.

S3 Endpoint: nyc3.digitaloceanspaces.com
DNS-style bucket+hostname:port template for accessing a bucket [%(bucket)s.s3.amazonaws.com]: %(bucket)s.nyc3.digitaloceanspaces.com
