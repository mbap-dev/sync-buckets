#!/bin/bash

export $(printenv | grep -E 'MINIO_|S3_|BUCKET_')

/sync.sh

exit 0
