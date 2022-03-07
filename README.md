# Backup Tools

Backup tools that handles data backup to S3 Compatible cloud storage for you.

## Installation

Follow the below step to install the software


* `git clone https://github.com/gdarko/s3-backup-tools`
* `apt install python3 python3-setuptools zip unzip`
* `cd /tmp && wget https://github.com/s3tools/s3cmd/releases/download/v2.2.0/s3cmd-2.2.0.zip`
* `unzip s3cmd-2.2.0.zip && cd s3cmd-2.2.0`
* `python3 setup.py install`


## Configuration

Next step is to configure the s3 storage credentials as follows

`s3cmd --configure`


### Aamazon S3

For aws you only need API access token and secret, leave everything else by default.


### Digital Ocean

For DigitalOCean you need to change the s3 endpoint and the bucket host.

```
S3 Endpoint: nyc3.digitaloceanspaces.com
DNS-style bucket+hostname:port template for accessing a bucket [%(bucket)s.s3.amazonaws.com]: %(bucket)s.nyc3.digitaloceanspaces.com
```

