FROM debian:stable-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y vim curl wget && \
    rm -rf /var/cache/apt/*
COPY script.sh script.sh

ENTRYPOINT [ "/bin/bash", "/app/script.sh" ]
CMD ["https://example.com"]