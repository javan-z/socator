FROM alpine:3.16.2
MAINTAINER javan-z

ADD ./tor-socat.sh /
ADD ./torrc /etc/tor/torrc

RUN apk update \
	&& apk upgrade  \
	&& apk add tor socat caddy curl\
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /tor-socat.sh

EXPOSE 5000

ENTRYPOINT ["/tor-socat.sh"]
