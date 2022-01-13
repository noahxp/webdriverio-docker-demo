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

- modify docker base image in [Dockerfile](./Dockerfile)
  - x86_64-chrome:  `selenium/standalone-chrome:latest`
  - x86_64-firefox: `selenium/standalone-firefox:latest`
  - arm64-chrome:  `seleniarm/standalone-chromium:latest`
  - arm64-firefox: `seleniarm/standalone-firefox:latest`
- build docker image

  ```bash
  # build docker image
  $ docker build -t="DOCKER_IMAGE" .

  # run in docker cotainer
  $ docker run -it --rm DOCKER_IMAGE
  ```
