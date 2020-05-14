ARG PHP_VERSION=7.2
ARG IMAGE_FROM=mishamx/php-nginx:${PHP_VERSION}-advanced

FROM mishamx/php-nginx:${PHP_VERSION}-advanced as builder
ARG BUILD_MODE=prod

USER root

RUN apk --update add wget \
		     curl \
		     git \
		     --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/*

# Install composer
COPY ./docker/install-composer.sh /install-composer
COPY ./docker/composer-install.sh /composer-install

RUN chmod +x /install-composer \
    && /install-composer \
    && rm /install-composer \
    && composer global require --no-progress "hirak/prestissimo:^0.3"


WORKDIR /build
RUN chown -R nginx.www-data /build
USER nginx:www-data

COPY ./composer.lock /build
COPY ./composer.json /build
COPY ./.bowerrc /build

RUN /composer-install ${BUILD_MODE}

FROM ${IMAGE_FROM}
ARG BUILD_MODE=prod
ENV RUN_MODE=${BUILD_MODE}

WORKDIR /var/www
COPY --from=builder /build/vendor /var/www/vendor
COPY . .
