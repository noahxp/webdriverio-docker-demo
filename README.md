# WebDriverIO deployment

## Run test

```bash
# run local chrome
$ npm run local

# run in docker
$ npm run docker
```

## deployment on docker image

- change docker image in [wdio.conf.docker.js](./wdio.conf.docker.js) and [Dockerfile](./Dockerfile)
- build docker image and run docker container

  ```bash
  # build docker image
  $ docker build -t="DOCKER_TAG" .
  # run docker container
  $ docker run -it --rm DOCKER_TAG
  ```
