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
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6565426103"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/node:latest</td>
    <td class="project-last-update">2023-10-18T19:11:40.606Z</td>
    </tr>
 <tr id="docker.io-library-rust-latest">
    <td class="project-name"><a href="community-images/docker.io/library/rust/latest">Rust Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6498133616"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/rust:latest</td>
    <td class="project-last-update">2023-10-12T16:11:56.839Z</td>
    </tr>
 <tr id="docker.io-library-ruby-latest">
    <td class="project-name"><a href="community-images/docker.io/library/ruby/latest">Ruby Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6498133694"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/ruby:latest</td>
    <td class="project-last-update">2023-10-12T16:11:00.176Z</td>
    </tr>
 <tr id="docker.io-library-ruby-3.1.3">
    <td class="project-name"><a href="community-images/docker.io/library/ruby/3.1.3">Ruby on Rails Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541118497"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/ruby:3.1.3</td>
    <td class="project-last-update">2023-03-28T08:58:05.388Z</td>
    </tr>
 <tr id="docker.io-library-jruby-latest">
    <td class="project-name"><a href="community-images/docker.io/library/jruby/latest">JRuby Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6508624698"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/jruby:latest</td>
    <td class="project-last-update">2023-10-13T13:10:16.037Z</td>
    </tr>
 <tr id="docker.io-library-php-latest">
    <td class="project-name"><a href="community-images/docker.io/library/php/latest">PHP Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6494212526"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/php:latest</td>
    <td class="project-last-update">2023-10-12T10:10:18.139Z</td>
    </tr>
 <tr id="docker.io-library-python-latest">
    <td class="project-name"><a href="community-images/docker.io/library/python/latest">Python Flask Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6496062325"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/python:latest</td>
    <td class="project-last-update">2023-10-12T13:12:04.163Z</td>
    </tr>
 <tr id="docker.io-library-python-3.10.0">
    <td class="project-name"><a href="community-images/docker.io/library/python/3.10.0">Python Django Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541117094"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/python:3.10.0</td>
    <td class="project-last-update">2023-03-28T08:57:28.153Z</td>
    </tr>
 <tr id="docker.io-library-dart-latest">
    <td class="project-name"><a href="community-images/docker.io/library/dart/latest">Dart Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6489921491"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/dart:latest</td>
    <td class="project-last-update">2023-10-12T01:09:21.360Z</td>
    </tr>
 <tr id="docker.io-library-erlang-latest">
    <td class="project-name"><a href="community-images/docker.io/library/erlang/latest">Erlang Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6494214021"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/erlang:latest</td>
    <td class="project-last-update">2023-10-12T10:12:42.645Z</td>
    </tr>
 <tr id="docker.io-library-groovy-latest">
    <td class="project-name"><a href="community-images/docker.io/library/groovy/latest">Groovy Grails Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6510495767"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/groovy:latest</td>
    <td class="project-last-update">2023-10-13T16:16:25.737Z</td>
    </tr>
 <tr id="docker.io-library-elixir-latest">
    <td class="project-name"><a href="community-images/docker.io/library/elixir/latest">Elixir Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6502713717"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/elixir:latest</td>
    <td class="project-last-update">2023-10-13T01:13:17.934Z</td>
    </tr>
 <tr id="docker.io-library-haxe-latest">
    <td class="project-name"><a href="community-images/docker.io/library/haxe/latest">Haxe Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6496060421"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/haxe:latest</td>
    <td class="project-last-update">2023-10-12T13:09:50.554Z</td>
    </tr>
 <tr id="docker.io-library-julia-latest">
    <td class="project-name"><a href="community-images/docker.io/library/julia/latest">Julia Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6488500122"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/julia:latest</td>
    <td class="project-last-update">2023-10-11T22:12:33.773Z</td>
    </tr>
 <tr id="docker.io-library-swift-latest">
    <td class="project-name"><a href="community-images/docker.io/library/swift/latest">Swift Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6506856412"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/swift:latest</td>
    <td class="project-last-update">2023-10-13T10:14:04.133Z</td>
    </tr>
 <tr id="docker.io-library-haskell-latest">
    <td class="project-name"><a href="community-images/docker.io/library/haskell/latest">Haskell Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6554786264"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/haskell:latest</td>
    <td class="project-last-update">2023-10-18T01:13:17.640Z</td>
    </tr>
 <tr id="docker.io-library-golang-latest">
    <td class="project-name"><a href="community-images/docker.io/library/golang/latest">Golang Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6496063019"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/golang:latest</td>
    <td class="project-last-update">2023-10-12T13:10:56.069Z</td>
    </tr>
 <tr id="docker.io-library-perl-latest">
    <td class="project-name"><a href="community-images/docker.io/library/perl/latest">Perl Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6499859289"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/perl:latest</td>
    <td class="project-last-update">2023-10-12T19:11:31.801Z</td>
    </tr>
 <tr id="docker.io-library-clojure-latest">
    <td class="project-name"><a href="community-images/docker.io/library/clojure/latest">Clojure Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6503876145"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/clojure:latest</td>
    <td class="project-last-update">2023-10-13T04:11:12.677Z</td>
    </tr>
 <tr id="docker.io-library-pypy-latest">
    <td class="project-name"><a href="community-images/docker.io/library/pypy/latest">PyPy & FastAPI Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6496064129"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/pypy:latest</td>
    <td class="project-last-update">2023-10-12T13:11:01.431Z</td>
    </tr>
 <tr id="docker.io-library-mono-latest">
    <td class="project-name"><a href="community-images/docker.io/library/mono/latest">Mono Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6492399033"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/mono:latest</td>
    <td class="project-last-update">2023-10-12T09:13:57.969Z</td>
    </tr>
 <tr id="docker.io-library-openjdk-latest">
    <td class="project-name"><a href="community-images/docker.io/library/openjdk/latest">OpenJDK Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541118569"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/openjdk:latest</td>
    <td class="project-last-update">2023-03-28T09:05:05.858Z</td>
    </tr>
 <tr id="docker.io-library-amazoncorretto-latest">
    <td class="project-name"><a href="community-images/docker.io/library/amazoncorretto/latest">Amazon Corretto Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6502713791"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/amazoncorretto:latest</td>
    <td class="project-last-update">2023-10-13T01:10:05.085Z</td>
    </tr>
 <tr id="docker.io-library-nginx-latest">
    <td class="project-name"><a href="community-images/docker.io/library/nginx/latest">NGINX Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6491105960"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/nginx:latest</td>
    <td class="project-last-update">2023-10-12T06:15:31.459Z</td>
    </tr>
 <tr id="docker.io-library-httpd-latest">
    <td class="project-name"><a href="community-images/docker.io/library/httpd/latest">HTTPD Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6488498281"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/httpd:latest</td>
    <td class="project-last-update">2023-10-11T22:08:46.257Z</td>
    </tr>
 <tr id="docker.io-library-tomcat-latest">
    <td class="project-name"><a href="community-images/docker.io/library/tomcat/latest">Tomcat Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6556066034"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/tomcat:latest</td>
    <td class="project-last-update">2023-10-18T04:10:45.840Z</td>
    </tr>
 <tr id="docker.io-library-jetty-latest">
    <td class="project-name"><a href="community-images/docker.io/library/jetty/latest">Jetty Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6510495867"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/jetty:latest</td>
    <td class="project-last-update">2023-10-13T16:11:05.168Z</td>
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
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6489923223"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/redis:latest</td>
    <td class="project-last-update">2023-10-12T01:24:00.016Z</td>
    </tr>

 <tr id="docker.io-grafana-grafana-latest-ubuntu">
    <td class="project-name"><a href="community-images/docker.io/grafana/grafana/latest-ubuntu">Grafana</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6496063878"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">grafana/grafana:latest-ubuntu</td>
    <td class="project-last-update">2023-10-12T14:09:33.255Z</td>
    </tr>

 <tr id="docker.io-prom-prometheus-latest">
    <td class="project-name"><a href="community-images/docker.io/prom/prometheus/latest">Prometheus</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6499858055"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">prom/prometheus:latest</td>
    <td class="project-last-update">2023-10-12T19:10:39.183Z</td>
    </tr>

 <tr id="docker.io-library-drupal-9.4.9-php8.1">
    <td class="project-name"><a href="community-images/docker.io/library/drupal/9.4.9-php8.1">Drupal</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4753162325"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/drupal:9.4.9-php8.1</td>
    <td class="project-last-update">2023-04-20T10:59:55.554Z</td>
    </tr>

 <tr id="docker.io-library-wordpress-latest">
    <td class="project-name"><a href="community-images/docker.io/library/wordpress/latest">Wordpress</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6515461391"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/wordpress:latest</td>
    <td class="project-last-update">2023-10-14T04:13:35.812Z</td>
    </tr>

 <tr id="docker.io-library-maven-latest">
    <td class="project-name"><a href="community-images/docker.io/library/maven/latest">Maven Build Jar</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6515459918"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/maven:latest</td>
    <td class="project-last-update">2023-10-14T06:16:39.434Z</td>
    </tr>

 <tr id="docker.io-library-gradle-latest">
    <td class="project-name"><a href="community-images/docker.io/library/gradle/latest">Gradle Build Jar</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6505118747"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/gradle:latest</td>
    <td class="project-last-update">2023-10-13T09:15:59.688Z</td>
 </tr>
 
 <tr id="docker.io-jenkins-jenkins-latest">
    <td class="project-name"><a href="community-images/docker.io/jenkins/jenkins/latest">Jenkins</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/6549859659"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">jenkins/jenkins:latest</td>
    <td class="project-last-update">2023-10-17T16:15:33.318Z</td>
    </tr>
    
 <tr id="docker.io-library-php-zendserver-latest">
    <td class="project-name"><a href="community-images/docker.io/library/php-zendserver/latest">PHP Zend Server</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5151742944"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/php-zendserver:latest</td>
    <td class="project-last-update">2023-06-02T06:35:27.877Z</td>
    </tr>
    
</table>
<!-- image-runner-status-table-base-image-edel -->

## Disclaimer
Images and code are provided under the MIT License. Slim.AI does not assume responsibility nor warranty the functionality of these container images or code. 
