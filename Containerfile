FROM alpine:latest
RUN apk update && apk add --no-cache bash curl jq tini

ADD plugin.sh /
RUN chmod a+x /plugin.sh

ENTRYPOINT ["/sbin/tini", "--", "/plugin.sh"]