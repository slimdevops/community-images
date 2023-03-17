
[slim.ai](imgs/slim.ai.png)

Looking to ship library/perl to production in a secure way without spending hours wrestling with your Dockerfiles? 

This community image example automatically hardens your application for production, reducing the size from 894 MB to 8.5 MB and removes 328 vulnerabilities along the way. 

This action starts by building an containerized application based off of the library/perl image, and then runs it against its test suite found in the project folder.

[Process Diagram](process.png)

Next, it uses the Slim.ai API to run the container hardening process and create a brand new container image containing fewer files, dependencies, and vulnerabilities — no new code required! The new container will then run against the same test suite to verify its functionality.

![status-badge](https://img.shields.io/badge/Build-Passing-green.svg)

## Results

You can see the results of the slim tests here!
| Metric | Original | Hardened | Percent Change | 
| ---| --- | --- | --- | 
| Size | 894 MB | 8.5 MB | 99.00 | 
| File Count | 24065 | 152 | 99.00 | 
| Vulnerabilities | 328 | 0 | 100.00 | 
| Critical Vulnerabilities | 11 | 0 | 
| High Vulnerabilities | 107 | 0 | 


You can check out the [new container image](https://portal.slim.dev/home/xray/dockerhub:%2F%2Fdockerhub.public%2Ffocaloiddev%2Fperl:latest.slimxx#explorer) for yourself on the Slim Platform (free registration required). 

Apply this process to your own container images for results like this!

### Have Questions or Need Help? Join Our  Community!

Interested in seeing more examples like this? Questions about integrating these actions into your own pipelines? Get in touch through our [community discord](https://discord.com/invite/uBttmfyYNB).
