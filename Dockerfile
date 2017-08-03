FROM markadams/chromium-xvfb-js:6

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y libgconf-2-4 bzip2 yarn \
    && rm -rf /var/lib/apt/lists

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

COPY start.sh /usr/src/config/start.sh

ENTRYPOINT ["dumb-init", "--"]

CMD ["/usr/src/config/start.sh"]
