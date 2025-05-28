FROM alpine:latest

RUN apk add --no-cache bash curl

RUN curl https://dl.min.io/client/mc/release/linux-amd64/mc \
    --create-dirs \
    -o /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

RUN mc --version

COPY sync.sh /sync.sh
RUN chmod +x /sync.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
