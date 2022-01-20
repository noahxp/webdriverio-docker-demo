# WebDriverIO example

run in docker container and packaged as docker image

## init project

```bash
# first init
$ npm install
```

## Run test

- Basic usage

  ```bash
  # run local chrome
  $ npm run local

  # run docker chrome image , platform x86_64
  $ npm run docker-chrome

  # run docker chrome image , platform arm64
  $ npm run docker-chrome-arm64

  # run docker firefox image , platform x86_64
  $ npm run docker-firefox

  # run docker firefox image , platform arm64
  $ npm run docker-firefox-arm64

  ```

## Packaged as docker image

- build docker image

  ```bash
  # build docker image as x86_64-chrome
  $ docker build --target x86_64-chrome -t="DOCKER_IMAGE" .

  # build docker image as x86_64-firefox
  $ docker build --target x86_64-firefox -t="DOCKER_IMAGE" .

  # build docker image as arm64-chrome
  $ docker build --target arm64-chrome -t="DOCKER_IMAGE" .

  # build docker image as arm64-firefox
  $ docker build --target arm64-firefox -t="DOCKER_IMAGE" .

  # run in docker cotainer
  $ docker run -it --rm DOCKER_IMAGE
  ```
