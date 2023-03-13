#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
HELPER_DIR="$SCRIPT_DIR/helpers"
BASEIMAGE=""

TARGET_CONNECTOR=""

if [[ $PROJECT_SOURCE == "dockerfile" ]]; then
  BASEIMAGE=$PROJECT_TARGET_IMAGE
  TARGET_CONNECTOR=$CONNECTOR_ID
else
  BASEIMAGE=$PROJECT_ORIGINAL_IMAGE
  TARGET_CONNECTOR="dockerhub.public"
fi

result=$($HELPER_DIR/flatten_json.sh "$PROJECT_FULL_PATH/project.json" ".slim_cli" "--" "=")
if [[ "$?" == "0" ]]; then
  extraArgs=$result
elif [[ "$?" == "2" ]]; then
  extraArgs=""
else
  echo $result
  exit 1
  #$PROJECT_TARGET_IMAGE/
fi

echo "Additional Args: $extraArgs"

log_output=$(slim instrument \
  --target-image-connector $TARGET_CONNECTOR \
  --instrumented-image-connector $CONNECTOR_ID \
  --instrumented-image $PROJECT_FULL_IMAGE_INSTRUMENTED \
  --hardened-image-connector $CONNECTOR_ID \
  --hardened-image $PROJECT_FULL_IMAGE_SLIMMED \
  $extraArgs \
  $BASEIMAGE 2>&1 | tee /dev/stderr)

workflow_id=$(echo "$log_output" | grep -Eo 'workflow id: [a-zA-Z0-9\.]+')
workflow_id=${workflow_id#"workflow id: "}

if [[ $log_output =~ "[instrument] instrumented" ]]; then
  echo "The image has been successfully instrumented ($workflow_id)."
else
  echo "The image instrumentation failed ($workflow_id)."
  exit 1
fi

echo "SLIMAI_WORKFLOW_ID=$workflow_id" >>$GITHUB_ENV
