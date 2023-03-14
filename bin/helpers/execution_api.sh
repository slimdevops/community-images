#!/usr/bin/env bash
if [[ -z "$1" ]]; then
    echo "Error: request parameter missing !"
    echo "Usage: echo \"<json input>\" | ./execution_api.sh json_output_file"
    exit 1
fi
jsonRequest=$(cat -)
echo $jsonRequest
reportResultFile="$1"
nx=$(curl -s -H 'Content-Type: application/json' -X POST -u :${API_TOKEN} https://${API_DOMAIN}/orgs/${ORGANIZATION_ID}/engine/executions -d "${jsonRequest}")
executionID=$(jq -r '.id' <<<"${nx}")

nxState="unknown"
while [[ ${nxState} != "completed" ]]; do
    nxState=$(curl -s -u :${API_TOKEN} https://${API_DOMAIN}/orgs/${ORGANIZATION_ID}/engine/executions/${executionID} | jq -r '.state')
    printf "Execution State: ${nxState}\n"
    [[ "${nxState}" == "failed" || "${nxState}" == "null" ]] && {
        echo "API Execution Command Failed - Exiting..."
        exit 1
    }
    sleep 3
done

echo "SLIMAI_EXECUTION_ID: ${executionID}"
echo "SLIMAI_EXECUTION_STATE: ${nxState}"

report=$(curl -L -H 'accept: application/json' -X GET -u ":${API_TOKEN}" "https://${API_DOMAIN}/orgs/${ORGANIZATION_ID}/engine/executions/${executionID}/result/report")
echo $report >>$reportResultFile
