#!/bin/bash

gitbook build \
&& aws s3 sync --delete --profile=haiku-prod --exclude=".git/*" --acl=public-read ./_book/ s3://docs.haikuforteams.com/ \
&& aws configure set preview.cloudfront true \
&& aws --profile=haiku-prod cloudfront create-invalidation --distribution-id=E1IHL7700VYR5J --paths "/*" \
&& echo 'Deployed!'