#!/usr/bin/env bash
$HOOK_EXEC before-cleanup $STAGE
if [[ $STAGE == "INSTRUMENT" ]]; then
    echo "Instrumented Step -- Gracetime set to 300 Seconds"
    docker stop -t 300 $PROJECT_CONTAINER_NAME
else
    docker stop $PROJECT_CONTAINER_NAME
fi

docker wait $PROJECT_CONTAINER_NAME
docker rm --force $PROJECT_CONTAINER_NAME

pid=$(sudo lsof -t -i:$APP_PORT)
if [[ ! -z "$pid" ]]; then
    echo "Killing Process App Port: $pid"
    sudo kill -9 $pid
fi

$HOOK_EXEC after-cleanup $STAGE

if [[ "$PROJECT_CLEAN_DOCKER" == "true" ]]; then
    docker system df
    echo "Cleaning Docker"
    docker system prune -af
    docker system df
fi

echo "Cleanup Completed"
