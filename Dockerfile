FROM alpine

RUN apk add --no-cache chrony

COPY entrypoint.sh /entrypoint.sh

EXPOSE 123/udp

HEALTHCHECK CMD chronyc tracking || exit 1

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]