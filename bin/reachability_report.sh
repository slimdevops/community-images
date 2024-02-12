#!/usr/bin/env bash
set -euo pipefail

IMAGE=${PROJECT_TARGET_IMAGE}

echo "Computing package reachability for image ${IMAGE} using connector ${TARGET_CONNECTOR_ID}"

slim reachability packages \
  --connector ${TARGET_CONNECTOR_ID} \
  --ichp-nx ${SLIMAI_WORKFLOW_ID} \
  --print-all \
  --format json \
  ${IMAGE} | tee ${PROJECT_FULL_PATH}/reachable-packages.json

