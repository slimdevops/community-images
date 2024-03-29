#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
HELPER_DIR="$SCRIPT_DIR/helpers"

generate_xray_report() {
    result_file_path="$PROJECT_FULL_PATH/vscan-xray-reports"
    mkdir -p $result_file_path
    ${HELPER_DIR}/generate_report.sh "xray" "$result_file_path/xray-$3-$4-report.json" "$1" "$2" "$3" "$4"
    if [[ "$?" != "0" ]]; then
        echo "X-Ray Error:"
        exit 1
    fi
}

TARGET_CONNECTOR="dockerhub.public"
TARGET_NAMESPACE=$NAMESPACE
TARGET_REPO=$REPOSITORY

if [[ $PROJECT_SOURCE == "dockerfile" ]]; then
  TARGET_CONNECTOR=$CONNECTOR_ID
  TARGET_NAMESPACE=$SLIM_IMAGE_NS
  TARGET_REPO=$PROJECT_TARGET_REPOSITORY
fi

echo "X-Ray'ing Fat Image"
generate_xray_report $TARGET_CONNECTOR $TARGET_NAMESPACE $TARGET_REPO $TAG
echo "X-Ray'ing Hardened Image"
generate_xray_report $CONNECTOR_ID $SLIM_IMAGE_NS $TARGET_REPO $PROJECT_IMAGE_TAG_SLIM
echo "PROJECT_XRAY_DONE=true" >>$GITHUB_ENV

 