#!/bin/sh

MODE=$1

echo "Composer install with $MODE mode"

if [ "$MODE" = "prod" ]
then
    echo "prod"
    composer install --no-progress --ignore-platform-reqs --prefer-dist --no-ansi --no-dev --no-interaction --no-plugins --no-scripts --no-suggest --optimize-autoloader
else
    echo "dev"
    composer install --no-progress --ignore-platform-reqs --prefer-dist --profile --optimize-autoloader
fi