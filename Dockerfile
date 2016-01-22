FROM alpine:latest

# Note: Tor is only in testing repo
RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    && rm -rf /var/cache/apk/*

# Default port to used for incoming Tor connections
# Can be changed by changing 'ORPort' in torrc
EXPOSE 9001

# Copy in our torrc files.
#COPY torrc.bridge /etc/tor/torrc.bridge
COPY torrc.middle /etc/tor/torrc.middle
#COPY torrc.exit /etc/tor/torrc.exit

# Make sure files are owned by Tor user.
RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
