#!/bin/bash

gitbook build \
&& aws s3 sync --delete --profile=haiku --exclude=".git/*" --acl=public-read ./_book/ s3://docs.haiku.ai/ \
&& aws configure set preview.cloudfront true \
&& aws --profile=haiku s3api put-object --bucket=docs.haiku.ai \
       --acl=public-read --website-redirect-location=/release-notes/index.html \
       --key=release-notes \
&& aws --profile=haiku cloudfront create-invalidation --distribution-id=E1Z1KZNU21Z4PY --paths "/*" \
&& echo 'Deployed!'
