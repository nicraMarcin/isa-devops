FROM debian:stable-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y vim curl wget && \
    rm -rf /var/cache/apt/*


ENTRYPOINT [ "curl", "-v",  "https://example.com"]