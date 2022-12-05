docker restart $(docker ps -a --format '{{.Names}}' --filter "name=ssb-sse.(\d)")
