#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Error: request parameter missing !"
    echo "Usage: ./flatten_json.sh json_file [key_path] [result_prefix] [value_seperator=\" \"]"
    exit 1
fi

if [[ ! -f $1 ]]; then
    echo 'Error: JSON file not found !'
    exit 1
fi

result_prefix=${3:-""}
value_seperator=${4:-" "}

json=$(<$1)
key_path="$2" || ""

if ! jq -e . >/dev/null 2>&1 <<<"$json"; then
    echo "Failed to parse JSON."
    exit 1
fi

if [[ ! -z "$key_path" ]]; then
    has_slim_cli=$(jq -r "\"$key_path\"" <<<"${json}")
    if [[ -z $has_slim_cli ]]; then
        echo "Key not found, $key_path"
        exit 2
    fi
    resolved_node=$(jq -r $key_path <<<"${json}")
else
    resolved_node="${json}"
fi

jq_logic='. as $in | paths(scalars) as $p | {path: $p | map(select(type=="string")) | join("."), value: getpath($p)} | select(.value | type == "string" or type == "number") | "__result_prefix__\(.path)\(if .path == "" then "" else "__value_seperator__" end)\(.value | tostring)"'
jq_logic=${jq_logic//__result_prefix__/$result_prefix}
jq_logic=${jq_logic//__value_seperator__/$value_seperator}

result=$(jq -r "$jq_logic" <<<"$resolved_node")
echo $result
