#!/bin/bash

export APP_ENV=test
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "::group::Database setup"
$DIR/bin/console doctrine:database:drop --force
$DIR/bin/console doctrine:database:create
$DIR/bin/console doctrine:migrations:migrate --no-interaction
echo "::endgroup::"

echo "::group::General setup"
sudo --preserve-env $DIR/bin/console elkarbackup:create_admin 
mkdir -p /tmp/elkarbackup-tests/uploads
$DIR/bin/console hautelook:fixtures:load --append
echo "::endgroup::"

echo "::group::Running unit tests"
$DIR/bin/phpunit "${@:1}"
echo "::endgroup::"
