#!/usr/bin/env bash

cd ./tmp/packages/grafana-e2e
yarn install --silent
RESULTS_PATH="../../../results/$ENV_TEST"
yarn start --reporter junit --reporter-options "mochaFile=$RESULTS_PATH/grafana-[hash].xml" --env "BASE_URL=http://localhost:$APP_PORT,SLOWMO=0" --config "fileServerFolder=./cypress,defaultCommandTimeout=30000,viewportHeight=1080,integrationFolder=../../e2e,testFiles=*-suite/*spec.ts,viewportWidth=1920,trashAssetsBeforeRuns=false,screenshotOnRunFailure=false,video=false,videoUploadOnPasses=false"
