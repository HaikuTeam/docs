#!/bin/bash

gitbook build \
&& aws s3 sync --delete --profile=haiku --exclude=".git/*" --acl=public-read ./_book/ s3://docs.haiku.ai/ \
&& aws configure set preview.cloudfront true \
&& aws --profile=haiku cloudfront create-invalidation --distribution-id=E1Z1KZNU21Z4PY --paths "/*" \
&& echo 'Deployed!'