FROM nginx:stable-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system docker
RUN adduser -G docker --system -D -s /bin/sh -u ${UID} docker
RUN sed -i "s/user  nginx/user docker/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/www