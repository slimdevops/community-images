#!/usr/bin/env bash

if [[ $PROJECT_SOURCE == "docker-compose" ]]; then
    echo "Not Implemented Yet !"
    exit 1
fi

if [[ $PROJECT_SOURCE == "dockerfile" ]]; then
    #Build Dockerfile
    $HOOK_EXEC before-build fat
    docker build . --file Dockerfile --tag $PROJECT_TARGET_IMAGE
    $HOOK_EXEC after-build fat

    $HOOK_EXEC before-push fat
    docker push $PROJECT_TARGET_IMAGE
    $HOOK_EXEC after-push fat
fi
