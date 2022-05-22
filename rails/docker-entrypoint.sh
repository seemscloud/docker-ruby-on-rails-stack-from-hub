#!/bin/bash

rails new . \
  --database postgresql \
  --skip-system-test \
  --skip-test

bundler install

rails db:migrate

rails server \
  --port "${LISTEN_PORT}" \
  --environment "${ENVIRONMENT}" \
  --binding "${LISTNE_ADDRESS}"