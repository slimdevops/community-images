#!/usr/bin/env bash
set -euo pipefail

sudo chown -R $(id -u):$(id -g) $PROJECT_FULL_PATH/results

#TODO: Make sure test results are generated

echo "Start: Test Results Merge."

#Source container test results merge
npx -y merge-junit $PROJECT_FULL_PATH/results/fat/*.xml -o $PROJECT_FULL_PATH/results/fat/merged-tests.xml
echo "Completed: Fat container test results merge."

npx -y merge-junit $PROJECT_FULL_PATH/results/instrumented/*.xml -o $PROJECT_FULL_PATH/results/instrumented/merged-tests.xml
echo "Completed: Instrumented container test results merge."

npx -y merge-junit $PROJECT_FULL_PATH/results/slim/*.xml -o $PROJECT_FULL_PATH/results/slim/merged-tests.xml
echo "Completed: Slim container test results merge."

test_stages=("fat" "instrumented" "slim")

for tstage in "${test_stages[@]}"; do
    if [ ! -f "$PROJECT_FULL_PATH/results/$tstage/merged-tests.xml" ]; then
        echo "Test result for stage: $tstage, not found !"
        exit 1
    fi
done

#Reading source container test result summary
fatresult=$(xmllint --xpath '/testsuites/@name | /testsuites/@failures | /testsuites/@tests' $PROJECT_FULL_PATH/results/fat/merged-tests.xml)

#Reading instrumented container test result summary
instrumentedresult=$(xmllint --xpath '/testsuites/@name | /testsuites/@failures | /testsuites/@tests' $PROJECT_FULL_PATH/results/fat/merged-tests.xml)

#Reading slimmed container test result summary
slimresult=$(xmllint --xpath '/testsuites/@name | /testsuites/@failures | /testsuites/@tests' $PROJECT_FULL_PATH/results/slim/merged-tests.xml)

echo "Start: test result comparison between source container e2e test result and instrumented container"
if [ "$fatresult" = "$instrumentedresult" ]; then
    echo "Test Comparison Succeeded :)"
else
    echo "Test Comparison Failed :("
    exit 1
fi

echo "test result comparison between source container e2e test result and slimmed container"
if [ "$fatresult" = "$slimresult" ]; then
    echo "Test Comparison Succeeded :)"
else
    echo "Test Comparison Failed :("
    exit 1
fi
