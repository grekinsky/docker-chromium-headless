# docker-chromium-headless
> Docker image for headless testing using chromium with Nodejs 10.x and NPM.

This image is tailored for running e2e tests using javascript frameworks like Cucumber.js and Chimp.js.

### Example:

```
FROM grekinsky/chromium-headless-testing

ENV HOME=/usr/src/app

COPY package.json $HOME/package.json
COPY package-lock.json $HOME/package-lock.json

RUN npm install

COPY . $HOME
```

You could add a volume where the test results are stored to persist data:

```
docker run \
    -v `pwd`/result:/usr/src/app/result \
    -e "RESULTFILE=/usr/src/app/result/test-results.json" \
    my-e2e-testimage
```
