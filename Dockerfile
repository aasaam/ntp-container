FROM alpine

ENV NTP_SERVERS="0.ubuntu.pool.ntp.org,1.ubuntu.pool.ntp.org,2.ubuntu.pool.ntp.org,3.ubuntu.pool.ntp.org,time.windows.com"

RUN apk add --no-cache chrony

COPY entrypoint.sh /entrypoint.sh

EXPOSE 123/udp

HEALTHCHECK CMD chronyc tracking || exit 1

ENTRYPOINT [ "/bin/sh", "/entrypoint.sh" ]