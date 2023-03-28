#!/usr/bin/env bash
echo "Install Slim.ai CLI"
curl https://platform.slim.dev/.service/releases/slim/latest | sh
echo "Install XML Utilities"
sudo apt-get update -qq
sudo apt install -qq -y libxml2-utils
echo "Configure Slim.ai CLI"
echo "Adding ${HOME}/.slim/bin"
export PATH="${HOME}/.slim/bin:$PATH"
slim config gen --save --token ${API_TOKEN} --org ${ORGANIZATION_ID}
#Optional For Testing
slim status build
echo "${HOME}/.slim/bin" >>$GITHUB_PATH