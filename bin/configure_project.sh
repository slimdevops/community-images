#!/usr/bin/env bash

jsonData="$(<$PROJECT_FULL_PATH/project.json)"

PROJECT_IMAGE_TAG_INSTRUMENTED="$TAG.instrumented"
PROJECT_IMAGE_TAG_SLIM="$TAG.slimxx"

PROJECT_ORIGINAL_IMAGE="$NAMESPACE/$REPOSITORY:$TAG"


PROJECT_CONTAINER_NAME="community_container"
PROJECT_NAME=$(jq -r '.name' <<<"${jsonData}")
PROJECT_SOURCE=$(jq -r '.source' <<<"${jsonData}")
PROJECT_CLEAN_DOCKER=$(jq -r '.clean_docker' <<<"${jsonData}")
PROJECT_CATEGORY=$(jq -r '.category // "unknown"' <<<"${jsonData}")

#TODO: Image hello world image name, need to be revisited for a better solution
TARGET_IMAGE_POSTFIX=""
if [[ "$PROJECT_CATEGORY" == "hello-world" && "$PROJECT_SOURCE" == "dockerfile" ]]; then
  TARGET_IMAGE_POSTFIX="-hello"
fi

#-------- Calculated Image Names --------------------------------------------------------------
PROJECT_TARGET_REPOSITORY="$REPOSITORY$TARGET_IMAGE_POSTFIX"
PROJECT_TARGET_IMAGE="$SLIM_IMAGE_NS/$PROJECT_TARGET_REPOSITORY:$TAG"
PROJECT_IMAGE_INSTRUMENTED="$SLIM_IMAGE_NS/$PROJECT_TARGET_REPOSITORY:$PROJECT_IMAGE_TAG_INSTRUMENTED"
PROJECT_IMAGE_SLIMMED="$SLIM_IMAGE_NS/$PROJECT_TARGET_REPOSITORY:$PROJECT_IMAGE_TAG_SLIM"

PROJECT_FULL_IMAGE_FAT="$SLIM_IMAGE_NS/$REPOSITORY:$PROJECT_IMAGE_TAG_SLIM"
PROJECT_FULL_IMAGE_INSTRUMENTED="$PROJECT_IMAGE_INSTRUMENTED"
PROJECT_FULL_IMAGE_SLIMMED="$PROJECT_IMAGE_SLIMMED"

if [[ ! -z "$SLIM_IMAGE_REGISTRY" ]]; then
  PROJECT_FULL_IMAGE_FAT="$SLIM_IMAGE_REGISTRY/$PROJECT_FULL_IMAGE_FAT"
  PROJECT_FULL_IMAGE_INSTRUMENTED="$SLIM_IMAGE_REGISTRY/$PROJECT_FULL_IMAGE_INSTRUMENTED"
  PROJECT_FULL_IMAGE_SLIMMED="$SLIM_IMAGE_REGISTRY/$PROJECT_FULL_IMAGE_SLIMMED"
fi
#------------------------------------------------------------------------------------------------


#Validations
PROJECT_SOURCE_LST=("docker-compose" "dockerfile" "image")

if [[ "${PROJECT_SOURCE_LST[*]}" =~ "${PROJECT_SOURCE}" ]]; then
  echo "Identified project source as $PROJECT_SOURCE"
else
  echo "Unsupported project source $PROJECT_SOURCE"
  exit 1
fi

if [[ $PROJECT_SOURCE == "docker-compose" ]]; then
  echo "docker-compose support not implemented yet !"
  exit 1
fi

if [[ "$PROJECT_CLEAN_DOCKER" == "true" ]]; then
  echo "Cleaning Docker"
  docker system prune -af
fi

#CONTROL VARIABLES INIT
WAIT_FOR_APP_PORT=0

APP_PORT=$(jq -r '.port' <<<"${jsonData}")
if [[ -z "$APP_PORT" ]]; then
  WAIT_FOR_APP_PORT=0
else
  WAIT_FOR_APP_PORT=1
fi

#PROJECT META DATA
echo "APP_PORT=$APP_PORT" >>$GITHUB_ENV
echo "PROJECT_NAME=$PROJECT_NAME" >>$GITHUB_ENV
echo "PROJECT_SOURCE=$PROJECT_SOURCE" >>$GITHUB_ENV

echo "PROJECT_TARGET_IMAGE=$PROJECT_TARGET_IMAGE" >>$GITHUB_ENV
echo "PROJECT_ORIGINAL_IMAGE=$PROJECT_ORIGINAL_IMAGE" >>$GITHUB_ENV
echo "PROJECT_IMAGE_INSTRUMENTED=$PROJECT_IMAGE_INSTRUMENTED" >>$GITHUB_ENV
echo "PROJECT_IMAGE_SLIMMED=$PROJECT_IMAGE_SLIMMED" >>$GITHUB_ENV

echo "PROJECT_FULL_IMAGE_FAT=$PROJECT_FULL_IMAGE_FAT" >>$GITHUB_ENV
echo "PROJECT_FULL_IMAGE_INSTRUMENTED=$PROJECT_FULL_IMAGE_INSTRUMENTED" >>$GITHUB_ENV
echo "PROJECT_FULL_IMAGE_SLIMMED=$PROJECT_FULL_IMAGE_SLIMMED" >>$GITHUB_ENV
echo "PROJECT_TARGET_REPOSITORY=$PROJECT_TARGET_REPOSITORY"
echo "PROJECT_IMAGE_TAG_INSTRUMENTED=$PROJECT_IMAGE_TAG_INSTRUMENTED" >>$GITHUB_ENV
echo "PROJECT_IMAGE_TAG_SLIM=$PROJECT_IMAGE_TAG_SLIM" >>$GITHUB_ENV

echo "WAIT_FOR_APP_PORT=$WAIT_FOR_APP_PORT" >>$GITHUB_ENV
echo "PROJECT_CONTAINER_NAME=$PROJECT_CONTAINER_NAME" >>$GITHUB_ENV
echo "PROJECT_CLEAN_DOCKER=$PROJECT_CLEAN_DOCKER" >>$GITHUB_ENV
#Project Steup Hook
