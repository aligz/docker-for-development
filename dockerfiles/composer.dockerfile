FROM composer:2

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system docker
RUN adduser -G docker --system -D -s /bin/sh -u ${UID} docker

WORKDIR /var/www