#!/usr/bin/env bash

json="$1"
port=$(jq -r '.run_host_ports' <<<"$json")
port_args=""
if [ -n "$port" ] && [ "$port" != "null" ]; then
    if jq -e 'select(type == "array")' <<<"$port" >/dev/null; then
        ports=$(grep -o '"[^"]*"' <<<"$port")
        for p in $ports; do
            p=${p//\"/}
            if [[ $p =~ ^[0-9]+:[0-9]+$ ]]; then
                # if port matches number:number format
                port_args+=" -p $p"
            elif [[ $p =~ ^[0-9]+$ ]]; then
                # if port is just a number
                port_args+=" -p $p:$p"
            else
                echo "Invalid port value in json: $p"
                exit 1
            fi
        done
    else
        if [[ $port =~ ^[0-9]+:[0-9]+$ ]]; then
            # if port matches number:number format
            port_args=" -p $port"
        elif [[ $port =~ ^[0-9]+$ ]]; then
            # if port is just a number
            port_args=" -p $port:$port"
        else
            echo "Invalid port value in json: $port"
            exit 1
        fi
    fi
else
    echo ""
fi
echo "$port_args"
