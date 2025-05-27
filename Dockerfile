FROM alpine:latest

RUN apk add --no-cache mc curl bash

COPY sync.sh /sync.sh
RUN chmod +x /sync.sh

COPY cronjob /etc/cron.d/sync-cron
RUN chmod 0644 /etc/cron.d/sync-cron
RUN crontab /etc/cron.d/sync-cron

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
