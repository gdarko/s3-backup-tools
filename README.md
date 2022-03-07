# Backup Tools

Various backup tools for managing backups on your Linux server by utilizing s3 cloud storage.

## Installation


`git clone https://github.com/gdarko/s3-backup-tools`

`apt install python3 python3-setuptools unzip`
`cd tmp`
`wget https://github.com/s3tools/s3cmd/releases/download/v2.2.0/s3cmd-2.2.0.zip`
`unzip s3cmd-*.zip`
`cd s3cmd-*`
`python3 setup.py install`


## Configuration

`s3cmd --configure`


### Aamazon S3

For aws you only need API access token and secret, leave everything else by default.


### Digital Ocean

For DigitalOCean you need to change the s3 endpoint and the bucket host.

```
S3 Endpoint: nyc3.digitaloceanspaces.com
DNS-style bucket+hostname:port template for accessing a bucket [%(bucket)s.s3.amazonaws.com]: %(bucket)s.nyc3.digitaloceanspaces.com
```

