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
if [[ $PROJECT_SOURCE == "dockerfile" ]]; then
  TARGET_CONNECTOR=$CONNECTOR_ID
fi

echo "X-Ray'ing Fat Image"
generate_xray_report $TARGET_CONNECTOR $NAMESPACE $REPOSITORY $TAG
echo "X-Ray'ing Hardened Image"
generate_xray_report $TARGET_CONNECTOR $SLIM_IMAGE_NS $REPOSITORY $PROJECT_IMAGE_TAG_SLIM
echo "PROJECT_XRAY_DONE=true" >>$GITHUB_ENV
