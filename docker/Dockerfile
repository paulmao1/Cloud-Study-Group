FROM alpine:latest
MAINTAINER Paul Mao <paul.mao@citrix.com>

ENV TERM=xterm

RUN apk update && \
    apk add freeradius tcpdump

ADD scripts/users /etc/raddb/users
ADD scripts/clients.conf /etc/raddb/clients.conf

ADD scripts/entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 1812 1813

ENTRYPOINT ["entrypoint.sh"]  
