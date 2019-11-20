FROM alpine:3.10

MAINTAINER Sebastien LANGOUREAUX <linuxworkgroup@hotmail.com>

ARG http_proxy
ARG https_proxy


RUN \
    apk add --update --no-cache build-base ruby-dev ruby-full ruby ruby-nokogiri zlib-dev bash sudo &&\
    gem install solargraph ruby-debug-ide


ADD etc/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ${PLUGIN_REMOTE_ENDPOINT_EXECUTABLE}