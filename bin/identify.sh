#!/usr/bin/env bash

PROJECT_PATH="community-images/$REGISTRY/$NAMESPACE/$REPOSITORY/$TAG"
PROJECT_FULL_PATH="$GITHUB_WORKSPACE/community-images/$REGISTRY/$NAMESPACE/$REPOSITORY/$TAG"

echo "PROJECT_PATH=$PROJECT_PATH" >>$GITHUB_ENV
echo "PROJECT_FULL_PATH=$PROJECT_FULL_PATH" >>$GITHUB_ENV
echo "REPOSITORY_FULL_PATH=$GITHUB_WORKSPACE" >>$GITHUB_ENV
echo "WORKFLOW_BIN_PATH=$GITHUB_WORKSPACE/bin" >>$GITHUB_ENV
echo "HOOK_EXEC=$GITHUB_WORKSPACE/bin/hook.sh" >>$GITHUB_ENV

if [ ! -d "$PROJECT_FULL_PATH" ]; then
  echo "PROJECT_IDENTIFIED=false" >>$GITHUB_OUTPUT
  echo "Unable to identify a suitable workflow for the image."
  exit 1
fi
echo "PROJECT_IDENTIFIED=true" >>$GITHUB_OUTPUT
echo "Project DIR: $PROJECT_PATH"