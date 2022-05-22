#!/bin/bash

rails new . \
  --database postgresql \
  --skip-system-test \
  --skip-test \
  --skip-git

bundler install

rails db:migrate

rails server \
  --port "${LISTEN_PORT}" \
  --environment "${ENVIRONMENT}" \
  --binding "${LISTNE_ADDRESS}"