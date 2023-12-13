#!/usr/bin/env bash
set -euo pipefail

for i in {1..6}; do
    if [ ! -v $i ]; then
        echo "Error: $i parameter missing !"
        echo "Usage: ./generate_report.sh report_type<xray|vscan> result_file namespace repository tag"
        exit 1
    fi
done

[[ "$1" != "vscan" && "$1" != "xray" ]] && {
    echo "Unsupported report type $1."
    exit 1
}

reportCommand="$1"
reportResultFile="$2"
registry="$3"
namespace="$4"
repository="$5"
tag="$6"

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

targetEntry="$(<$GITHUB_WORKSPACE/bin/templates/target.object.template)"
jsonData="$(<$GITHUB_WORKSPACE/bin/templates/slim.$reportCommand.json.template)"


targetEntry=${targetEntry//__CONNECTOR_ID__/$registry}
targetEntry=${targetEntry//__NAMESPACE__/$namespace}
targetEntry=${targetEntry//__REPOSITORY__/$repository}
targetEntry=${targetEntry//__TAG__/$tag}
jsonDataUpdated=${jsonData//__TARGET_OBJECT_ENTRY__/$targetEntry}

echo "$jsonDataUpdated"

echo "$jsonDataUpdated" | ${SCRIPT_DIR}/execution_api.sh "$reportResultFile"
if [[ "$?" != "0" ]]; then
    exit 1
fi