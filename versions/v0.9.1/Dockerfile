FROM node:4

MAINTAINER Christopher Biscardi <chris@christopherbiscardi.com>

WORKDIR /tmp

ENV PURESCRIPT_DOWNLOAD_SHA1 9e8ff98e1e5d0dbf34df5124dc42d3b73e9dc257

RUN cd /opt \
    && wget https://github.com/purescript/purescript/releases/download/v0.9.1/linux64.tar.gz \
    && echo "$PURESCRIPT_DOWNLOAD_SHA1 linux64.tar.gz" | sha1sum -c - \
    && tar -xvf linux64.tar.gz \
    && rm /opt/linux64.tar.gz

ENV PATH /opt/purescript:$PATH

RUN npm install -g bower pulp

RUN pulp init 2> /dev/null || true

RUN bower install purescript-psci-support --allow-root --save-dev

CMD [ "/usr/local/bin/pulp", "psci" ]