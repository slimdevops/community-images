#!/usr/bin/env bash
projectConfigData="$(<$PROJECT_FULL_PATH/project.json)"
PROJECT_TEST_SUITE_HOST_ARGS=$(jq -r '.test_suite_host_args // ""' <<<"${projectConfigData}")
PROJECT_TEST_SUITE_CONTAINER_ARGS=$(jq -r '.test_suite_container_args // ""' <<<"${projectConfigData}")
PROJECT_TEST_SUITE=$(jq -r '.test_suite // ""' <<<"${projectConfigData}")

sudo mkdir -m 777 -p ./results

$HOOK_EXEC before-test $STAGE
echo "Running test suite: "

if [ "$PROJECT_TEST_SUITE" == "custom" ]; then
  PROJECT_TEST_COMMAND=$(jq -r '.test_command' <<<"${projectConfigData}")
  eval $PROJECT_TEST_COMMAND
elif [ "$PROJECT_TEST_SUITE" == "newman" ]; then
  docker run --rm $PROJECT_TEST_SUITE_HOST_ARGS --net=host -v $(pwd):/etc/newman -v $(pwd)/results/$ENV_TEST:/usr/share/test-results:rw postman/newman:latest run "newman.test.json" --reporters cli,junit --reporter-junit-export /usr/share/test-results/tests.xml --insecure
elif [ "$PROJECT_TEST_SUITE" == "cypress" ]; then
  docker run --rm $PROJECT_TEST_SUITE_HOST_ARGS --net=host -v $(pwd)/cypress-e2e:/e2e -v $(pwd)/results/$ENV_TEST:/e2e/results:rw -w /e2e -e CYPRESS_VIDEO=false cypress/included:12.3.0
else
  echo "Test suite: $PROJECT_TEST_SUITE not found !"
  exit 1
fi
$HOOK_EXEC after-test $STAGE
