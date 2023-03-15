#!/usr/bin/env bash
BASE_PATH=$(pwd)
echo "www-data id = $(id -u www-data)"
echo "root id = $(id -u root)"
sudo cp $(pwd)/test.env $(pwd)/drupal_vol/web/core/.env
sudo chown -R www-data:www-data $(pwd)/drupal_vol
cd $(pwd)/drupal_vol

#Install Additional Vendor Dependencies for testing.
sudo -u root composer require --dev phpspec/prophecy-phpunit:^2 -n
sudo -u root composer require --dev behat/mink:^1.8 -n
sudo -u root composer require --dev behat/mink-selenium2-driver:^1.4 -n
sudo -u root composer require --dev composer/composer:^2.2.12 -n
sudo -u root composer require --dev drupal/coder:^8.3.10 -n
sudo -u root composer require --dev easyrdf/easyrdf:^0.9 -n
sudo -u root composer require --dev friends-of-behat/mink-browserkit-driver:^1.4 -n
sudo -u root composer require --dev instaclick/php-webdriver:^1.4.1 -n
sudo -u root composer require --dev justinrainbow/json-schema:^5.2 -n
sudo -u root composer require --dev mikey179/vfsstream:^1.6.8 -n
sudo -u root composer require --dev phpspec/prophecy:^1.12 -n
sudo -u root composer require --dev phpspec/prophecy-phpunit:^2 -n
sudo -u root composer require --dev phpunit/phpunit:^9 -n
sudo -u root composer require --dev symfony/browser-kit:^5.0 -n
sudo -u root composer require --dev symfony/css-selector:^5.0 -n
sudo -u root composer require --dev symfony/dom-crawler:^5.0 -n
sudo -u root composer require --dev symfony/error-handler:^4.4.41 -n
sudo -u root composer require --dev symfony/filesystem:^5.0 -n
sudo -u root composer require --dev symfony/finder:^5.0 -n
sudo -u root composer require --dev symfony/lock:^5.0 -n
sudo -u root composer require --dev symfony/phpunit-bridge:^5.4 -n
sudo -u root composer require --dev symfony/var-dumper:^5.4 -n
cd ./web/core

echo "Running Yarn"
sudo chmod 777 /home/runner/ #TODO: security check point: this needs to be updated
sudo -u www-data yarn install
sudo -u www-data yarn test:nightwatch

RESULTS_PATH="$BASE_PATH/results/$ENV_TEST"
mkdir -p $RESULTS_PATH
find ./reports/nightwatch/Tests/ -name "*.xml" -type f -size +0 -print0 | xargs -0 -I % cp % $RESULTS_PATH
