#!/bin/bash
mc alias set minio $MINIO_ENDPOINT $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
mc alias set s3 $S3_ENDPOINT $S3_ACCESS_KEY $S3_SECRET_KEY

# Sincroniza cada bucket
for bucket_pair in "${BUCKET_PAIRS[@]}"; do
  IFS=':' read -r src_bucket dest_bucket <<< "$bucket_pair"
  mc mirror --overwrite minio/$src_bucket s3/$dest_bucket
done
