#!/bin/bash

if [[ $WAIT_FOR_APP_PORT == 1 ]]; then
    echo "Waiting for the application to launch on $APP_PORT..."
    COUNTER=0
    while ! nc -z localhost $APP_PORT; do
        ((COUNTER = COUNTER + 1))
        #------- Check For Timeout
        if [ "$COUNTER" -ge "120" ]; then
            echo "------------------------------------- Docker Log ---------------------------"
            docker logs $PROJECT_CONTAINER_NAME
            echo "----------------------------------------------------------------------------"
            echo "Conatiner Stopped due to Timeout !"
            exit 1
        fi

        #------- Check for Docker Status for Background Containers
        if [ "$PROJECT_FOREGROUND_FLAG" != "true" ]; then
            CONTAINER_STATUS=$(docker ps --filter name=$PROJECT_CONTAINER_NAME --format '{{.Status}}')
            if [[ -z "$CONTAINER_STATUS" ]]; then
                echo "------------------------------------- Docker Log ---------------------------"
                docker logs $PROJECT_CONTAINER_NAME
                echo "----------------------------------------------------------------------------"
                echo "Conatiner Stopped Unexpectedly !"
                exit 1
            fi
        fi

        sleep 1
    done
    sleep 1

    if [ "$PROJECT_FOREGROUND_FLAG" != "true" ]; then
        echo "------------------------------------- Docker Log ---------------------------"
        docker logs $PROJECT_CONTAINER_NAME
        echo "----------------------------------------------------------------------------"
    fi

    echo "Application launched"
    $HOOK_EXEC after-launch $STAGE
fi
