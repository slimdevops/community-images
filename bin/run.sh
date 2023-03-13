#!/usr/bin/env bash

projectConfigData="$(<$PROJECT_FULL_PATH/project.json)"

CONTAINER_ARGS=""
PROJECT_FOREGROUND_FLAG=$(jq -r '.foreground // false' <<<"${projectConfigData}")
PROJECT_RUN_AS_USER=$(jq -r '.run_as // ""' <<<"${projectConfigData}")
RUN_HOST_NETWORK_VALUE=$(jq -r '.run_host_network // "host"' <<<"${projectConfigData}")
APP_PORT=$(jq -r '.port' <<<"${projectConfigData}")
RUN_PORTS_ARGS=$($WORKFLOW_BIN_PATH/helpers/parse_ports.sh "$projectConfigData")
PROJECT_RUN_HOST_ARGS=$(jq -r '.run_host_args // ""' <<<"${projectConfigData}")
PROJECT_RUN_CONTAINER_ARGS=$(jq -r '.run_container_args // ""' <<<"${projectConfigData}")
RUN_INSTRUMENTED_AS_USER=$(jq -r '.run_instrumented_as // ""' <<<"${projectConfigData}")

if [[ -z "$RUN_PORTS_ARGS" ]] && [[ "$RUN_HOST_NETWORK_VALUE" != "host" ]]; then
    RUN_PORTS_ARGS=" -p $APP_PORT:$APP_PORT"
fi
RUN_HOST_NETWORK="--net=$RUN_HOST_NETWORK_VALUE"

if [[ ! -z "$PROJECT_RUN_AS_USER" ]]; then
    PROJECT_RUN_AS_USER="--user $PROJECT_RUN_AS_USER"
elif [[ ! -z "$RUN_INSTRUMENTED_AS_USER" ]]; then
    RUN_INSTRUMENTED_AS_USER="--user $RUN_INSTRUMENTED_AS_USER"
fi

if [ "$PROJECT_FOREGROUND_FLAG" == "false" ]; then
    HOST_ARGS=" -d "
fi

HOST_ARGS="$HOST_ARGS $PROJECT_RUN_AS_USER"
HOST_ARGS="$HOST_ARGS $RUN_PORTS_ARGS $RUN_HOST_NETWORK $PROJECT_RUN_HOST_ARGS"

if [[ $STAGE == "FAT" ]]; then
    if [[ $PROJECT_SOURCE == "dockerfile" ]]; then
        IMAGE=$PROJECT_TARGET_IMAGE
    else
        IMAGE=$PROJECT_ORIGINAL_IMAGE
    fi
elif [[ $STAGE == "INSTRUMENT" ]]; then
    HOST_ARGS="$HOST_ARGS --cap-add ALL $RUN_INSTRUMENTED_AS_USER"
    IMAGE=$PROJECT_FULL_IMAGE_INSTRUMENTED

elif [[ $STAGE == "SLIM" ]]; then
    IMAGE=$PROJECT_FULL_IMAGE_SLIMMED
fi

docker pull $IMAGE

$HOOK_EXEC before-run $STAGE
echo "docker run --name $PROJECT_CONTAINER_NAME $HOST_ARGS $IMAGE $PROJECT_RUN_CONTAINER_ARGS"
eval "docker run --name $PROJECT_CONTAINER_NAME $HOST_ARGS $IMAGE $PROJECT_RUN_CONTAINER_ARGS"
$HOOK_EXEC after-run $STAGE
