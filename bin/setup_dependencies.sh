#!/usr/bin/env bash

echo "Install XML Utilities"
sudo apt-get update -qq
sudo apt install -qq -y libxml2-utils

echo "Install Slim.ai CLI"
SLIM_CLI_VERSION=$(curl -sq https://platform.zero.dev.saas.getslim.ai/.service/releases/slim | jq -r '.data[] | select(.latest == true) | .version')

[[ -z $SLIM_CLI_VERSION ]] && { 
    echo "Unable to identify latest CLI version !"; 
    exit 1;
}

echo "Slim CLI: $SLIM_CLI_VERSION"
curl https://platform.zero.dev.saas.getslim.ai/.service/releases/slim/$SLIM_CLI_VERSION | sh

echo "Configure Slim.ai CLI"
echo "Adding ${HOME}/.slim/bin"
export PATH="${HOME}/.slim/bin:$PATH"

mkdir -p ~/.config/slim/
echo "token: $API_TOKEN"> ~/.config/slim/config
echo "default_org: $ORGANIZATION_ID">> ~/.config/slim/config
echo "endpoint: https://$API_DOMAIN">> ~/.config/slim/config

#slim config gen --save --token ${API_TOKEN} --org ${ORGANIZATION_ID}
#Optional For Testing
slim status build
echo "${HOME}/.slim/bin" >>$GITHUB_PATH
echo "SLIM_CLI_VERSION=$SLIM_CLI_VERSION" >>$GITHUB_ENV