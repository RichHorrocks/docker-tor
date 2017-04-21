# docker-tor

Command to run:

```
$ docker run -d \
    -v /etc/localtime:/etc/localtime \ # so time is synced
    --restart always \ # why not?
    -p 9001:9001 \ # expose/publish the port
    --name tor-relay \
    jess/tor-relay -f /etc/tor/torrc.middle```
