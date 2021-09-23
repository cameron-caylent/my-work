#!/bin/bash

# run from deployment folder (per comments in .sh)
./build-s3-dist.sh $DIST_OUTPUT_BUCKET $TEMPLATE_OUTPUT_BUCKET $SOLUTION_NAME $VERSION

export REPLACE0="s/%DIST_BUCKET_NAME%/$DIST_OUTPUT_BUCKET/g"
export REPLACE1="s/%TEMPLATE_BUCKET_NAME%/$TEMPLATE_OUTPUT_BUCKET/g"
export REPLACE2="s/%SOLUTION_NAME%/$SOLUTION_NAME/g"
export REPLACE3="s/%VERSION%/$VERSION/g"

export DIST_OUTPUT_BUCKET=solutions
export TEMPLATE_OUTPUT_BUCKET=solutions-reference
export SOLUTIONS_NAME=customizations-for-aws-control-tower
export VERSION=v2.1.0
