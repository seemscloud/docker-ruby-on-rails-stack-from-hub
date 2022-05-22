FROM ruby:3.1.2-alpine3.15

ARG RAILS_VERSION
ARG APP_DIR="/app"
ARG APP_USER="rails"
ARG GEM_HOME="${APP_DIR}/.gem"
ARG GEM_PATH="${APP_DIR}/.gem"

ENV APP_DIR="${APP_DIR}"
ENV GEM_HOME="${GEM_HOME}"
ENV GEM_PATH="${GEM_PATH}"

RUN apk update && \
    apk add --no-cache bash && \
    apk add --no-cache --virtual build-dependencies build-base git postgresql-dev tzdata

SHELL ["/bin/bash", "-c"]

RUN adduser -s /bin/bash -h "${APP_DIR}" -D "${APP_USER}"

COPY --chown=rails ./docker-entrypoint.sh "${APP_DIR}"
COPY --chown=rails ./files/gemrc "${APP_DIR}"/.gemrc

USER "${APP_USER}"
WORKDIR "${APP_DIR}"

RUN gem install rails -v "${RAILS_VERSION}"

ENTRYPOINT ["/bin/bash", "docker-entrypoint.sh"]