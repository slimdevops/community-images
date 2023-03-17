#!/usr/bin/env bash
$HOOK_EXEC before-cleanup $STAGE
echo "Starting Cleanup"
if [[ $STAGE == "INSTRUMENT" ]]; then
    echo "Instrumented Step -- Gracetime set to 300 Seconds"
    docker stop -t 300 $PROJECT_CONTAINER_NAME
else
    docker stop -t 120 $PROJECT_CONTAINER_NAME
fi

docker wait $PROJECT_CONTAINER_NAME
docker rm --force $PROJECT_CONTAINER_NAME

pid=$(sudo lsof -t -i:$APP_PORT)
if [[ ! -z "$pid" ]]; then
    echo "Killing Process ($pid) Port: $APP_PORT"
    sudo kill -9 $pid && true
fi

$HOOK_EXEC after-cleanup $STAGE

if [[ "$PROJECT_CLEAN_DOCKER" == "true" ]]; then
    docker system df
    echo "Cleaning Docker"
    docker system prune -af && true
    docker system df
fi

echo "Cleanup Completed"
