# Minio

[If enjoy, please consider buying me a coffee.](https://www.buymeacoffee.com/ozbillwang)

Auto-trigger docker build for [minio](https://github.com/minio/minio) when new release is announced

[![DockerHub Badge](http://dockeri.co/image/alpine/minio)](https://hub.docker.com/r/alpine/minio/)

### NOTES

The docker tag `latest-release` is the latest release version (https://github.com/minio/minio/releases/latest)

Please avoid to use `latest-release` tag for any production deployment. Tag with right version is the proper way, such as `alpine/minio:RELEASE.2025-10-15T17-29-55Z`

For old tags, pull from https://hub.docker.com/r/minio/minio

### Github Repo

https://github.com/alpine-docker/minio

### CI build logs

https://github.com/alpine-docker/minio/actions

### Docker image tags

https://hub.docker.com/r/alpine/minio/tags/

# Usage

Standalone Mode (Local Storage)

```
docker run -p 9000:9000 -p 9001:9001 alpine/minio:RELEASE.2025-10-15T17-29-55Z server /tmp/minio --console-address :9001
```
Now open the web console:

http://localhost:9001

Default root credentials (username:password) is `minioadmin:minioadmin`

# Why we need it

The owner refused to privde the docker images any more, full story at:

https://github.com/minio/minio/issues/21647

# The Processes to build this image

* Enable CI cronjob on this repo to run build regularly on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with release version and push to https://hub.docker.com/
