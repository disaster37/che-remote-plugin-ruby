FROM eclipse/che-theia-endpoint-runtime:7.0.0-next

MAINTAINER Sebastien LANGOUREAUX <linuxworkgroup@hotmail.com>

ARG http_proxy
ARG https_proxy

RUN \
    apk add --update --no-cache ruby-dev ruby-full ruby &&\
    gem install solargraph
    

