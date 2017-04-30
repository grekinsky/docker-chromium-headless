# docker-chromium-headless
> Docker image for headless testing using chromium with Nodejs 6.x and Yarn.

This image is tailored for running e2e tests using javascript frameworks like Cucumber.js and Chimp.js.

It uses yarn to manage node packages.

### Example:

```
FROM grekinsky/chromium-headless-testing

ENV HOME=/usr/src/app

COPY package.json $HOME/package.json
COPY yarn.lock $HOME/yarn.lock

RUN yarn

COPY . $HOME
```

You could add a volume where the test results are stored to persist data:

```
docker run \
    -v `pwd`/result:/usr/src/app/result \
    -e "RESULTFILE=/usr/src/app/result/test-results.json" \
    my-e2e-testimage
```
