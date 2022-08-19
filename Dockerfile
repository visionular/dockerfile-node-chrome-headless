FROM node:bullseye

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
COPY linux_signing_key.pub ./

RUN apt-get update && apt-get install curl gnupg -y
RUN apt-key add linux_signing_key.pub
RUN  sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install google-chrome-stable -y --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*
