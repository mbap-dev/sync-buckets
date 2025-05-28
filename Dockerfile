FROM alpine:latest

RUN apk add --no-cache curl bash minio-client busybox-suid dcron

COPY sync.sh /sync.sh
RUN chmod +x /sync.sh

COPY cronjob /etc/cron.d/sync-cron
RUN chmod 0644 /etc/cron.d/sync-cron
RUN crontab /etc/cron.d/sync-cron

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
