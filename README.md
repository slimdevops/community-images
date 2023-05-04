<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://www.slim.ai/">
    <img src="https://www.slim.ai/_nuxt/img/logo_charcoal_424242.3a75b12.svg" alt="Logo" width="240">
  </a>
  <h1>Slim.AI's Community Image Repository</h1>
</div>

Welcome to Slim.AI Community Images. 

These slimmed, hardened containers use the Slim Developer Platform to create production-ready container examples with fewer vulnerabilities, reduced attack surface, and a streamlined software supply chain. 

Containers hardened via Slim typically see a 50- to 80-percent reduction in vulnerabilities, size, and number of files and packages. Slim's proprietary process also removes potential attack surface including shells, package managers, and dev tools (think: `curl` or `git`).

Eliminate the manual effort to manage container optimization through Dockerfile, multi-stage builds, and changing distributions. Let your developers work the way they want, and run the Slim process to harden your containers for production with speed and confidence. 

## Types of Images
In this repository, you'll find two types of images: 

- **Hello World Examples** that leverage a simple app built on a popular base image and are meant as application starting points for web apps, APIs, or other microservices. 
- **Standalone Applications**: These are fully functional images that leverage (where available) the end-to-end testing suites of the project itself. They can be used as drop-in replacements or as a jumping off point for a customer configuration. 

## How does it work? 
Community images are built using Slim.AI's [Automated Container Hardening](https://www.slim.ai/docs/automated-container-hardening) capability. 

![Flow chart of hardening process](/docs/images/HowItWorksV2.png)

First, build your image using any base image you please. Slim then adds a layer containing the Slim Sensor that will observe the image as it runs against a test suite. The Slim Sensor collects intelligence about what the container needs to run and what it doesn't. This information is shared with the Slim platform, which in turn creates a functionally equivalent, hardened container. 

We then re-run the same test suite to ensure the container operates as expected. The new container can be used in production instances with confidence that it is safe and secure. 

## Community Image Slimming Status

### `Hello World` Examples
These images are examples using popular base images such as `node:latest`. They build a simple application on top of the image and use the Slim platform to remove unnecessary libraries, dev tools, and files. They are not meant to be used as base images themselves, but rather serve as examples where you can replace the `Hello World` application code with your own.

<!-- image-runner-status-table-hello-world-del -->
<table id="status-hello-world">
  <tr>
    <th>Project</th>
    <th>Status</th>
    <th>Image</th>
    <th>Last Update</th>
  </tr>

 <tr id="docker.io-library-node-latest">
    <td class="project-name"><a href="community-images/docker.io/library/node/latest">NodeJS Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4874056577"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/node:latest</td>
    <td class="project-last-update">2023-05-03T16:12:08.874Z</td>
    </tr>
 <tr id="docker.io-library-rust-latest">
    <td class="project-name"><a href="community-images/docker.io/library/rust/latest">Rust Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4876959527"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/rust:latest</td>
    <td class="project-last-update">2023-05-03T22:12:42.007Z</td>
    </tr>
 <tr id="docker.io-library-ruby-latest">
    <td class="project-name"><a href="community-images/docker.io/library/ruby/latest">Ruby Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4876960098"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/ruby:latest</td>
    <td class="project-last-update">2023-05-03T22:12:13.690Z</td>
    </tr>
 <tr id="docker.io-library-ruby-3.1.3">
    <td class="project-name"><a href="community-images/docker.io/library/ruby/3.1.3">Ruby on Rails Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541118497"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/ruby:3.1.3</td>
    <td class="project-last-update">2023-03-28T08:58:05.388Z</td>
    </tr>
 <tr id="docker.io-library-jruby-latest">
    <td class="project-name"><a href="community-images/docker.io/library/jruby/latest">JRuby Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4814860229"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/jruby:latest</td>
    <td class="project-last-update">2023-04-27T01:10:52.947Z</td>
    </tr>
 <tr id="docker.io-library-php-latest">
    <td class="project-name"><a href="community-images/docker.io/library/php/latest">PHP Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4870680097"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/php:latest</td>
    <td class="project-last-update">2023-05-03T10:10:16.641Z</td>
    </tr>
 <tr id="docker.io-library-python-latest">
    <td class="project-name"><a href="community-images/docker.io/library/python/latest">Python Flask Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4880012052"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/python:latest</td>
    <td class="project-last-update">2023-05-04T07:11:43.121Z</td>
    </tr>
 <tr id="docker.io-library-python-3.10.0">
    <td class="project-name"><a href="community-images/docker.io/library/python/3.10.0">Python Django Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541117094"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/python:3.10.0</td>
    <td class="project-last-update">2023-03-28T08:57:28.153Z</td>
    </tr>
 <tr id="docker.io-library-dart-latest">
    <td class="project-name"><a href="community-images/docker.io/library/dart/latest">Dart Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4876958650"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/dart:latest</td>
    <td class="project-last-update">2023-05-03T22:10:49.376Z</td>
    </tr>
 <tr id="docker.io-library-erlang-latest">
    <td class="project-name"><a href="community-images/docker.io/library/erlang/latest">Erlang Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4875590566"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/erlang:latest</td>
    <td class="project-last-update">2023-05-03T19:14:24.823Z</td>
    </tr>
 <tr id="docker.io-library-groovy-latest">
    <td class="project-name"><a href="community-images/docker.io/library/groovy/latest">Groovy Grails Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4813789407"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/groovy:latest</td>
    <td class="project-last-update">2023-04-26T22:23:24.660Z</td>
    </tr>
 <tr id="docker.io-library-elixir-latest">
    <td class="project-name"><a href="community-images/docker.io/library/elixir/latest">Elixir Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4868438126"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/elixir:latest</td>
    <td class="project-last-update">2023-05-03T05:04:01.965Z</td>
    </tr>
 <tr id="docker.io-library-haxe-latest">
    <td class="project-name"><a href="community-images/docker.io/library/haxe/latest">Haxe Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4881512762"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/haxe:latest</td>
    <td class="project-last-update">2023-05-04T10:11:07.827Z</td>
    </tr>
 <tr id="docker.io-library-julia-latest">
    <td class="project-name"><a href="community-images/docker.io/library/julia/latest">Julia Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4869219476"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/julia:latest</td>
    <td class="project-last-update">2023-05-03T07:12:37.069Z</td>
    </tr>
 <tr id="docker.io-library-swift-latest">
    <td class="project-name"><a href="community-images/docker.io/library/swift/latest">Swift Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4740451852"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/swift:latest</td>
    <td class="project-last-update">2023-04-19T07:07:36.125Z</td>
    </tr>
 <tr id="docker.io-library-haskell-latest">
    <td class="project-name"><a href="community-images/docker.io/library/haskell/latest">Haskell Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4875589901"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/haskell:latest</td>
    <td class="project-last-update">2023-05-03T19:20:41.217Z</td>
    </tr>
 <tr id="docker.io-library-golang-latest">
    <td class="project-name"><a href="community-images/docker.io/library/golang/latest">Golang Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4875590007"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/golang:latest</td>
    <td class="project-last-update">2023-05-03T21:13:59.369Z</td>
    </tr>
 <tr id="docker.io-library-perl-latest">
    <td class="project-name"><a href="community-images/docker.io/library/perl/latest">Perl Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4875589538"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/perl:latest</td>
    <td class="project-last-update">2023-05-03T19:13:31.150Z</td>
    </tr>
 <tr id="docker.io-library-clojure-latest">
    <td class="project-name"><a href="community-images/docker.io/library/clojure/latest">Clojure Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4813788713"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/clojure:latest</td>
    <td class="project-last-update">2023-04-26T22:12:25.665Z</td>
    </tr>
 <tr id="docker.io-library-pypy-latest">
    <td class="project-name"><a href="community-images/docker.io/library/pypy/latest">PyPy & FastAPI Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4875590427"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/pypy:latest</td>
    <td class="project-last-update">2023-05-03T19:13:38.688Z</td>
    </tr>
 <tr id="docker.io-library-mono-latest">
    <td class="project-name"><a href="community-images/docker.io/library/mono/latest">Mono Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4876959688"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/mono:latest</td>
    <td class="project-last-update">2023-05-03T22:11:58.421Z</td>
    </tr>
 <tr id="docker.io-library-openjdk-latest">
    <td class="project-name"><a href="community-images/docker.io/library/openjdk/latest">OpenJDK Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541118569"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/openjdk:latest</td>
    <td class="project-last-update">2023-03-28T09:05:05.858Z</td>
    </tr>
 <tr id="docker.io-library-amazoncorretto-latest">
    <td class="project-name"><a href="community-images/docker.io/library/amazoncorretto/latest">Amazon Corretto Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4757960900"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/amazoncorretto:latest</td>
    <td class="project-last-update">2023-04-20T19:10:42.177Z</td>
    </tr>
 <tr id="docker.io-library-nginx-latest">
    <td class="project-name"><a href="community-images/docker.io/library/nginx/latest">NGINX Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4876958733"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/nginx:latest</td>
    <td class="project-last-update">2023-05-03T22:09:24.536Z</td>
    </tr>
 <tr id="docker.io-library-httpd-latest">
    <td class="project-name"><a href="community-images/docker.io/library/httpd/latest">HTTPD Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4876958860"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/httpd:latest</td>
    <td class="project-last-update">2023-05-03T22:10:16.715Z</td>
    </tr>
 <tr id="docker.io-library-tomcat-latest">
    <td class="project-name"><a href="community-images/docker.io/library/tomcat/latest">Tomcat Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4872246541"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/tomcat:latest</td>
    <td class="project-last-update">2023-05-03T13:11:18.838Z</td>
    </tr>
 <tr id="docker.io-library-jetty-latest">
    <td class="project-name"><a href="community-images/docker.io/library/jetty/latest">Jetty Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4867267215"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/jetty:latest</td>
    <td class="project-last-update">2023-05-03T01:10:35.020Z</td>
    </tr>
</table>

<!-- image-runner-status-table-hello-world-edel -->

### Standalone Applications
These applications are standalone containers that can run on their own. Where necessary, they include basic configurations and use the end-to-end testing suites for project to exercise the container. These images can be used as is (without warranty) or tweaked for your own use. 

<!-- image-runner-status-table-base-image-del -->
<table id="status-base-image">
  <tr>
    <th>Project</th>
    <th>Status</th>
    <th>Image</th>
    <th>Last Update</th>
  </tr>
  
 <tr id="docker.io-library-redis-latest">
    <td class="project-name"><a href="community-images/docker.io/library/redis/latest">Redis</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4872244119"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/redis:latest</td>
    <td class="project-last-update">2023-05-03T13:25:34.758Z</td>
    </tr>

 <tr id="docker.io-grafana-grafana-latest-ubuntu">
    <td class="project-name"><a href="community-images/docker.io/grafana/grafana/latest-ubuntu">Grafana</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4740910742"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">grafana/grafana:latest-ubuntu</td>
    <td class="project-last-update">2023-04-19T08:51:32.043Z</td>
    </tr>

 <tr id="docker.io-prom-prometheus-latest">
    <td class="project-name"><a href="community-images/docker.io/prom/prometheus/latest">Prometheus</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4741290219"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">prom/prometheus:latest</td>
    <td class="project-last-update">2023-04-19T08:44:01.121Z</td>
    </tr>

 <tr id="docker.io-library-drupal-9.4.9-php8.1">
    <td class="project-name"><a href="community-images/docker.io/library/drupal/9.4.9-php8.1">Drupal</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4753162325"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/drupal:9.4.9-php8.1</td>
    <td class="project-last-update">2023-04-20T10:59:55.554Z</td>
    </tr>

 <tr id="docker.io-library-wordpress-latest">
    <td class="project-name"><a href="community-images/docker.io/library/wordpress/latest">Wordpress</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4880013304"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/wordpress:latest</td>
    <td class="project-last-update">2023-05-04T07:14:35.289Z</td>
    </tr>

 <tr id="docker.io-library-maven-latest">
    <td class="project-name"><a href="community-images/docker.io/library/maven/latest">Maven Build Jar</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4814861396"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/maven:latest</td>
    <td class="project-last-update">2023-04-27T01:12:29.546Z</td>
    </tr>

 <tr id="docker.io-library-gradle-latest">
    <td class="project-name"><a href="community-images/docker.io/library/gradle/latest">Gradle Build Jar</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4813789103"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/gradle:latest</td>
    <td class="project-last-update">2023-04-26T22:14:52.031Z</td>
 </tr>
 
 <tr id="docker.io-jenkins-jenkins-latest">
    <td class="project-name"><a href="community-images/docker.io/jenkins/jenkins/latest">Jenkins</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4425578024"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">jenkins/jenkins:latest</td>
    <td class="project-last-update">2023-03-15T11:14:11.236Z</td>
    </tr>
    
 <tr id="docker.io-library-php-zendserver-latest">
    <td class="project-name"><a href="community-images/docker.io/library/php-zendserver/latest">PHP Zend Server</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541117093"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/php-zendserver:latest</td>
    <td class="project-last-update">2023-03-28T12:36:05.086Z</td>
    </tr>
    
</table>
<!-- image-runner-status-table-base-image-edel -->

## Disclaimer
Images and code are provided under the MIT License. Slim.AI does not assume responsibility nor warranty the functionality of these container images or code. 
