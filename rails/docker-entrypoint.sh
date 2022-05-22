#!/bin/bash

rails server \
  --port "${LISTEN_PORT}" \
  --environment "${ENVIRONMENT}" \
  --binding "${LISTNE_ADDRESS}"
