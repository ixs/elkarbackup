#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

docker-compose -f "${DIR}/docker-compose.yml" up --abort-on-container-exit --exit-code-from elkarbackup
err=$?

# Cleanup
docker compose -f "${DIR}/docker-compose.yml" down

if [ "$err" -eq 0 ]; then
    echo -e "\033[1;32m✅ Success: All checks passed!\033[0m"
else
    echo -e "\033[1;31m❌ Failure: One or more checks failed (err=$err).\033[0m"
fi
exit $err
