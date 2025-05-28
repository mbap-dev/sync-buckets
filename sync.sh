#!/bin/bash

echo "$(date): Iniciando sincronização MinIO -> S3"

mc alias set minio $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
mc alias set s3 $S3_ENDPOINT $S3_ACCESS_KEY $S3_SECRET_KEY

# Verifica se BUCKET_PAIRS está definido
if [ -z "$BUCKET_PAIRS" ]; then
    echo "ERRO: BUCKET_PAIRS não está definido"
    exit 1
fi

IFS=',' read -ra PAIRS <<< "$BUCKET_PAIRS"
for pair in "${PAIRS[@]}"; do
    IFS=':' read -r src_bucket dest_bucket <<< "$pair"

    echo "$(date): Sincronizando $src_bucket -> $dest_bucket"

    mc mirror --overwrite minio/$src_bucket s3/$dest_bucket

    if [ $? -eq 0 ]; then
        echo "$(date): Sincronização de $src_bucket concluída com sucesso"
    else
        echo "$(date): ERRO na sincronização de $src_bucket"
        exit 1
    fi
done

echo "$(date): Todas as sincronizações concluídas"
