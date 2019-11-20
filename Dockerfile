FROM alpine:3.10

MAINTAINER Sebastien LANGOUREAUX <linuxworkgroup@hotmail.com>

ARG http_proxy
ARG https_proxy

ENV HOME=/home/theia


RUN \
    apk add --update --no-cache build-base ruby-dev ruby-full ruby ruby-nokogiri zlib-dev bash sudo &&\
    gem install solargraph ruby-debug-ide

# Require for CHE
# Change permissions to let any arbitrary user
RUN mkdir /projects ${HOME} && \
    for f in "${HOME}" "/etc/passwd" "/projects"; do \
      echo "Changing permissions on ${f}" && chgrp -R 0 ${f} && \
      chmod -R g+rwX ${f}; \
    done
ADD etc/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ${PLUGIN_REMOTE_ENDPOINT_EXECUTABLE}