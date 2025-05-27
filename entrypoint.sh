#!/bin/bash
# Carrega variáveis para o cron
printenv | grep -E 'MINIO_|S3_|CRON_' > /etc/environment
exec cron -f
