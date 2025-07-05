#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

docker-compose -f "${DIR}/docker-compose.yml" up --abort-on-container-exit --exit-code-from elkarbackup
