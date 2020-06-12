#!/bin/sh

MODE=$1

echo "Composer install with $MODE mode"

case $MODE in
    prod)
        echo "prod"
        composer install --no-progress --ignore-platform-reqs --prefer-dist --no-ansi --no-dev --no-interaction --no-plugins --no-scripts --no-suggest --optimize-autoloader
        ;;

    dev)
        echo "prod"
        composer install --no-progress --ignore-platform-reqs --prefer-dist --profile --optimize-autoloader
        ;;

    *)
        echo "Skip composer install"
        exit 0;
    ;;
esac