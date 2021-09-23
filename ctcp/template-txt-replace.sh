#!/bin/bash

# ./template-txt-replace.sh $DIST_OUTPUT_BUCKET $TEMPLATE_OUTPUT_BUCKET $SOLUTION_NAME $VERSION

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
    echo "Please provide the base source bucket name, template-bucket, trademark approved solution name, and version"
    echo "For example: ./build-s3-dist.sh solutions template-bucket trademarked-solution-name v1.0.0"
    exit 1
fi

CODE_BUCKET_NAME=$1
TEMPLATE_BUCKET_NAME=$2
SOLUTION_NAME=$3
VERSION=$4

export REPLACE0="s/%DIST_BUCKET_NAME%/$CODE_BUCKET_NAME/g"
export REPLACE1="s/%TEMPLATE_BUCKET_NAME%/$TEMPLATE_BUCKET_NAME/g"
export REPLACE2="s/%SOLUTION_NAME%/$SOLUTION_NAME/g"
export REPLACE3="s/%VERSION%/$VERSION/g"


# env vars > script var > template placeholder var
# DIST_OUTPUT_BUCKET > CODE_BUCKET_NAME > %DIST_BUCKET_NAME% (in template)
# replace="s/%DIST_BUCKET_NAME%/$CODE_BUCKET_NAME/g"
sed -i -e "$REPLACE0" ./custom-control-tower-initiation.template

# TEMPLATE_OUTPUT_BUCKET > TEMPLATE_BUCKET_NAME > %TEMPLATE_BUCKET_NAME% (in template)
# replace="s/%TEMPLATE_BUCKET_NAME%/$TEMPLATE_BUCKET_NAME/g"
sed -i -e "$REPLACE1" ./custom-control-tower-initiation.template

# SOLUTION_NAME > SOLUTION_NAME > %SOLUTION_NAME%
# replace="s/%SOLUTION_NAME%/$SOLUTION_NAME/g"
sed -i -e "$REPLACE2" ./custom-control-tower-initiation.template

# VERSION > VERSION_NUMBER > %VERSION%
# replace="s/%VERSION%/$VERSION_NUMBER/g"
sed -i -e "$REPLACE3" ./custom-control-tower-initiation.template


