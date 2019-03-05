#!/bin/bash

yarn gitbook install \
&& yarn gitbook build \
&& aws s3 sync --delete --profile=haiku-prod --exclude=".git/*" --acl=public-read ./_book/ s3://docs.haikuforteams.com/ \
&& aws configure set preview.cloudfront true \
&& aws --profile=haiku-prod s3api put-object --bucket=docs.haikuforteams.com \
       --acl=public-read --website-redirect-location=/release-notes/index.html \
       --key=release-notes \
&& aws --profile=haiku-prod cloudfront create-invalidation --distribution-id=E1IHL7700VYR5J --paths "/*" \
&& echo 'Deployed!'
