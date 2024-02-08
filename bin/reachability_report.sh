#!/usr/bin/env bash
set -euo pipefail

if [[ "${PROJECT_SOURCE}" == "dockerfile" ]]; then
  IMAGE=${PROJECT_TARGET_IMAGE}
else
  IMAGE=${PROJECT_ORIGINAL_IMAGE}
fi

slim reachability packages -q \
  --connector ${CONNECTOR_ID} \
  --ichp-nx ${SLIMAI_WORKFLOW_ID} \
  --print-all \
  --format json \
  ${IMAGE} | tee reachable-packages.json
