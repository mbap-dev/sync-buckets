#!/bin/bash
# Carrega variáveis de ambiente
export $(printenv | grep -E 'MINIO_|S3_|BUCKET_')

# Executa sincronização uma vez
/sync.sh

# Sai do container
exit 0
