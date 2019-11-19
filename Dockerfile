FROM eclipse/che-theia-endpoint-runtime:7.0.0-next

MAINTAINER Sebastien LANGOUREAUX <linuxworkgroup@hotmail.com>

ARG http_proxy
ARG https_proxy

ENV \
    USER=theia \
    GROUP=theia \
    USER_ID=1724 \
    GROUP_ID=1724

RUN \
    apk add --update --no-cache build-base ruby-dev ruby-full ruby ruby-nokogiri zlib1g-dev bash &&\
    gem install solargraph ruby-debug-ide

# Create default user for che
RUN \
    addgroup -g ${GROUP_ID} ${GROUP} &&\
    adduser -s /bin/sh -G ${GROUP} -D -u ${USER_ID} ${USER}

WORKDIR /projects
