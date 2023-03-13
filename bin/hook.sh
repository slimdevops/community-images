#!/usr/bin/env bash

projectConfigData="$(<$PROJECT_FULL_PATH/project.json)"
HOOKS_PATH=$(jq -r '.hooks_path // "hooks"' <<<"${projectConfigData}")
full_hook_path=$PROJECT_FULL_PATH/$HOOKS_PATH

stage=$(echo $2 | tr '[:upper:]' '[:lower:]')
case "$1" in
project-setup | before-build | after-build | before-push | after-push | before-run | after-run | after-launch | before-test | after-test | before-cleanup | after-cleanup)
    if [[ ! -z "$stage" ]] && [[ -f "$full_hook_path/$stage-$1.sh" ]]; then
        echo "$stage-$1 hook identified, executing: "
        chmod +x $full_hook_path/$stage-$1.sh
        eval $full_hook_path/$stage-$1.sh
    fi

    if [[ -f "$full_hook_path/$1.sh" ]]; then
        echo "$1 hook identified, executing: "
        chmod +x $full_hook_path/$1.sh
        eval $full_hook_path/$1.sh
    fi
    ;;
*)
    echo "\`$1\` hook not defined !"
    exit 1
    ;;
esac
