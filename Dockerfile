FROM markadams/chromium-xvfb-js:6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y libgconf-2-4 bzip2 yarn \
    && rm -rf /var/lib/apt/lists

COPY start.sh /usr/src/config/start.sh

ENTRYPOINT ["/usr/src/config/start.sh"]
