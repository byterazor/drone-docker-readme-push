---
lang: EN_US
---

# drone-docker-readme-push

## Description

This repository contains a Containerfile for building a drone plugin to publish the full_description of 
an docker image to docker hub.

### PLUGIN Variables

* `REPOSITORY_NAME` - the full repository name you want to update at docker-hub (e.g. `username/repository`)
* `FILENAME` - the full path to the file containing the docker image description (e.g. `./full_description`)
* `USERNAME` - your docker hub username
* `PASSWORD` - your docker hub password or access token
qq
## Supported Architectures

- amd64
- arm64

## Updates

I am trying to update the image weekly as long as my private kubernetes cluster is available. So I do not promise anything and do **not** rely 
your business on this image.


## Source Repository

* https://gitea.federationhq.de/Container/drone-docker-readme-push.git

## Prebuild Images

* https://hub.docker.com/repository/docker/byterazor/drone-docker-readme-push/general

## Authors

* **Dominik Meyer** - *Initial work* 

## License

This project is licensed under the MPLv2 License - see the [LICENSE](LICENSE) file for details.
