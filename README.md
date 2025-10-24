# Minio

[If enjoy, please consider buying me a coffee.](https://www.buymeacoffee.com/ozbillwang)

Auto-trigger docker build for [minio](https://github.com/minio/minio) when new release is announced

[![DockerHub Badge](http://dockeri.co/image/alpine/minio)](https://hub.docker.com/r/alpine/minio/)

### NOTES

The latest docker tag is the latest release version (https://github.com/minio/minio/releases/latest)

Please avoid to use `latest` tag for any production deployment. Tag with right version is the proper way, such as `alpine/minio:RELEASE.2025-10-15T17-29-55Z`

### Github Repo

https://github.com/alpine-docker/minio

### CI build logs

https://github.com/alpine-docker/minio/actions

### Docker image tags

https://hub.docker.com/r/alpine/minio/tags/

# Usage

TODO

# Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment

# The Processes to build this image

* Enable CI cronjob on this repo to run build regularly on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with release version and push to https://hub.docker.com/
