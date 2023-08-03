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
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5697647693"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/node:latest</td>
    <td class="project-last-update">2023-07-29T01:11:56.244Z</td>
    </tr>
 <tr id="docker.io-library-rust-latest">
    <td class="project-name"><a href="community-images/docker.io/library/rust/latest">Rust Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5693958511"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/rust:latest</td>
    <td class="project-last-update">2023-07-28T21:12:05.514Z</td>
    </tr>
 <tr id="docker.io-library-ruby-latest">
    <td class="project-name"><a href="community-images/docker.io/library/ruby/latest">Ruby Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5693960023"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/ruby:latest</td>
    <td class="project-last-update">2023-07-28T16:11:30.829Z</td>
    </tr>
 <tr id="docker.io-library-ruby-3.1.3">
    <td class="project-name"><a href="community-images/docker.io/library/ruby/3.1.3">Ruby on Rails Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541118497"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/ruby:3.1.3</td>
    <td class="project-last-update">2023-03-28T08:58:05.388Z</td>
    </tr>
 <tr id="docker.io-library-jruby-latest">
    <td class="project-name"><a href="community-images/docker.io/library/jruby/latest">JRuby Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5747671631"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/jruby:latest</td>
    <td class="project-last-update">2023-08-03T07:10:09.230Z</td>
    </tr>
 <tr id="docker.io-library-php-latest">
    <td class="project-name"><a href="community-images/docker.io/library/php/latest">PHP Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5693957809"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/php:latest</td>
    <td class="project-last-update">2023-07-28T21:11:28.457Z</td>
    </tr>
 <tr id="docker.io-library-python-latest">
    <td class="project-name"><a href="community-images/docker.io/library/python/latest">Python Flask Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5690753169"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/python:latest</td>
    <td class="project-last-update">2023-07-28T10:12:11.119Z</td>
    </tr>
 <tr id="docker.io-library-python-3.10.0">
    <td class="project-name"><a href="community-images/docker.io/library/python/3.10.0">Python Django Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541117094"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/python:3.10.0</td>
    <td class="project-last-update">2023-03-28T08:57:28.153Z</td>
    </tr>
 <tr id="docker.io-library-dart-latest">
    <td class="project-name"><a href="community-images/docker.io/library/dart/latest">Dart Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5688085316"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/dart:latest</td>
    <td class="project-last-update">2023-07-28T04:08:48.294Z</td>
    </tr>
 <tr id="docker.io-library-erlang-latest">
    <td class="project-name"><a href="community-images/docker.io/library/erlang/latest">Erlang Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5696684854"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/erlang:latest</td>
    <td class="project-last-update">2023-07-28T22:11:44.990Z</td>
    </tr>
 <tr id="docker.io-library-groovy-latest">
    <td class="project-name"><a href="community-images/docker.io/library/groovy/latest">Groovy Grails Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5663442132"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/groovy:latest</td>
    <td class="project-last-update">2023-07-26T01:17:05.246Z</td>
    </tr>
 <tr id="docker.io-library-elixir-latest">
    <td class="project-name"><a href="community-images/docker.io/library/elixir/latest">Elixir Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5699151310"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/elixir:latest</td>
    <td class="project-last-update">2023-07-29T07:13:20.995Z</td>
    </tr>
 <tr id="docker.io-library-haxe-latest">
    <td class="project-name"><a href="community-images/docker.io/library/haxe/latest">Haxe Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5697647041"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/haxe:latest</td>
    <td class="project-last-update">2023-07-29T01:09:31.653Z</td>
    </tr>
 <tr id="docker.io-library-julia-latest">
    <td class="project-name"><a href="community-images/docker.io/library/julia/latest">Julia Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5688086280"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/julia:latest</td>
    <td class="project-last-update">2023-07-28T04:12:04.476Z</td>
    </tr>
 <tr id="docker.io-library-swift-latest">
    <td class="project-name"><a href="community-images/docker.io/library/swift/latest">Swift Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5458672974"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/swift:latest</td>
    <td class="project-last-update">2023-07-04T22:13:38.471Z</td>
    </tr>
 <tr id="docker.io-library-haskell-latest">
    <td class="project-name"><a href="community-images/docker.io/library/haskell/latest">Haskell Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5689222296"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/haskell:latest</td>
    <td class="project-last-update">2023-07-28T07:18:42.241Z</td>
    </tr>
 <tr id="docker.io-library-golang-latest">
    <td class="project-name"><a href="community-images/docker.io/library/golang/latest">Golang Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5733495803"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/golang:latest</td>
    <td class="project-last-update">2023-08-02T01:11:51.299Z</td>
    </tr>
 <tr id="docker.io-library-perl-latest">
    <td class="project-name"><a href="community-images/docker.io/library/perl/latest">Perl Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5722454814"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/perl:latest</td>
    <td class="project-last-update">2023-08-01T04:11:29.856Z</td>
    </tr>
 <tr id="docker.io-library-clojure-latest">
    <td class="project-name"><a href="community-images/docker.io/library/clojure/latest">Clojure Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5663442559"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/clojure:latest</td>
    <td class="project-last-update">2023-07-26T01:11:18.564Z</td>
    </tr>
 <tr id="docker.io-library-pypy-latest">
    <td class="project-name"><a href="community-images/docker.io/library/pypy/latest">PyPy & FastAPI Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5693959878"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/pypy:latest</td>
    <td class="project-last-update">2023-07-28T16:10:40.066Z</td>
    </tr>
 <tr id="docker.io-library-mono-latest">
    <td class="project-name"><a href="community-images/docker.io/library/mono/latest">Mono Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5688085939"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/mono:latest</td>
    <td class="project-last-update">2023-07-28T04:10:56.829Z</td>
    </tr>
 <tr id="docker.io-library-openjdk-latest">
    <td class="project-name"><a href="community-images/docker.io/library/openjdk/latest">OpenJDK Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4541118569"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/openjdk:latest</td>
    <td class="project-last-update">2023-03-28T09:05:05.858Z</td>
    </tr>
 <tr id="docker.io-library-amazoncorretto-latest">
    <td class="project-name"><a href="community-images/docker.io/library/amazoncorretto/latest">Amazon Corretto Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5674149852"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/amazoncorretto:latest</td>
    <td class="project-last-update">2023-07-26T22:09:54.156Z</td>
    </tr>
 <tr id="docker.io-library-nginx-latest">
    <td class="project-name"><a href="community-images/docker.io/library/nginx/latest">NGINX Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5688085204"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/nginx:latest</td>
    <td class="project-last-update">2023-07-28T04:08:49.654Z</td>
    </tr>
 <tr id="docker.io-library-httpd-latest">
    <td class="project-name"><a href="community-images/docker.io/library/httpd/latest">HTTPD Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5688086021"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/httpd:latest</td>
    <td class="project-last-update">2023-07-28T04:08:42.808Z</td>
    </tr>
 <tr id="docker.io-library-tomcat-latest">
    <td class="project-name"><a href="community-images/docker.io/library/tomcat/latest">Tomcat Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5663442615"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/tomcat:latest</td>
    <td class="project-last-update">2023-07-26T01:11:14.357Z</td>
    </tr>
 <tr id="docker.io-library-jetty-latest">
    <td class="project-name"><a href="community-images/docker.io/library/jetty/latest">Jetty Hello World</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5663441815"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/jetty:latest</td>
    <td class="project-last-update">2023-07-26T01:10:33.596Z</td>
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
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5693959533"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/redis:latest</td>
    <td class="project-last-update">2023-07-28T21:24:05.867Z</td>
    </tr>

 <tr id="docker.io-grafana-grafana-latest-ubuntu">
    <td class="project-name"><a href="community-images/docker.io/grafana/grafana/latest-ubuntu">Grafana</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5667421272"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">grafana/grafana:latest-ubuntu</td>
    <td class="project-last-update">2023-07-26T11:10:41.521Z</td>
    </tr>

 <tr id="docker.io-prom-prometheus-latest">
    <td class="project-name"><a href="community-images/docker.io/prom/prometheus/latest">Prometheus</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5659119553"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">prom/prometheus:latest</td>
    <td class="project-last-update">2023-07-25T16:10:18.535Z</td>
    </tr>

 <tr id="docker.io-library-drupal-9.4.9-php8.1">
    <td class="project-name"><a href="community-images/docker.io/library/drupal/9.4.9-php8.1">Drupal</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4753162325"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/drupal:9.4.9-php8.1</td>
    <td class="project-last-update">2023-04-20T10:59:55.554Z</td>
    </tr>

 <tr id="docker.io-library-wordpress-latest">
    <td class="project-name"><a href="community-images/docker.io/library/wordpress/latest">Wordpress</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5698440857"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/wordpress:latest</td>
    <td class="project-last-update">2023-07-29T04:13:38.890Z</td>
    </tr>

 <tr id="docker.io-library-maven-latest">
    <td class="project-name"><a href="community-images/docker.io/library/maven/latest">Maven Build Jar</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5651443062"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/maven:latest</td>
    <td class="project-last-update">2023-07-25T01:11:49.232Z</td>
    </tr>

 <tr id="docker.io-library-gradle-latest">
    <td class="project-name"><a href="community-images/docker.io/library/gradle/latest">Gradle Build Jar</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/5663442429"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">library/gradle:latest</td>
    <td class="project-last-update">2023-07-26T01:13:20.483Z</td>
 </tr>
 
 <tr id="docker.io-jenkins-jenkins-latest">
    <td class="project-name"><a href="community-images/docker.io/jenkins/jenkins/latest">Jenkins</a></td>
    <td class="project-status"><a href="https://github.com/slimdevops/community-images/actions/runs/4973273200"><img src="https://img.shields.io/badge/Build-Passing-green.svg" /></a></td>
    <td class="project-image">jenkins/jenkins:latest</td>
    <td class="project-last-update">2023-05-14T16:17:11.106Z</td>
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
