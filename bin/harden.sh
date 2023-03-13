#!/usr/bin/env bash

echo "Hardening workflow: $SLIMAI_WORKFLOW_ID"
log_output=$(slim harden --id $SLIMAI_WORKFLOW_ID 2>&1 | tee /dev/stderr)

if [[ $log_output =~ "[instrument] completed" ]]; then
  echo "The image has been successfully hardened ($SLIMAI_WORKFLOW_ID)."
else
  echo "The image hardening failed ($SLIMAI_WORKFLOW_ID)."
  exit 1
fi
