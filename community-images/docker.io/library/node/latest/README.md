
![Slim.AI Banner Image](/docs/images/SlimBanner_3.png)

Looking to ship library/node to production in a secure way without spending hours wrestling with your Dockerfiles? 

This community image example automatically hardens your application for production, reducing the size from 1.1 GB to 120 MB and removes 270 vulnerabilities along the way. 

Images labelled `Hello World` are meant to be starting points for application development. Simply replace the Hello World app code with your own and re-run the process for similar results. Standalone applications can be used as is, or reconfigured to meet your needs. 

The process starts by building an containerized application based off of the library/node image, and then runs it against its test suite found in the project folder.

![Process Diagram](/docs/images/HowItWorksV2.png)

Next, we use Slim.AI to run the container hardening process and create a brand new container image, removing unnecessary files, dependencies, and vulnerabilities — no new code required! The new container will then run against the same test suite to verify its functionality.

![status-badge](https://img.shields.io/badge/Build-Passing-green.svg)

## Results

You can see the results of the slim tests here!

| Metric | Original | Hardened | Percent Change | 
| ---| --- | --- | --- | 
| Size | 1.1 GB | 120 MB | 89.00 | 
| File Count | 27553 | 603 | 97.00 | 
| Vulnerabilities | 288 | 18 | 93.00 | 
| Critical Vulnerabilities | 2 | 0 | 
| High Vulnerabilities | 36 | 2 | 


You can check out the [new container image](https://portal.slim.dev/home/xray/dockerhub:%2F%2Fdockerhub.public%2Fslimdevops%2Fnode:latest.slimxx#explorer) for yourself on the Slim Platform (free registration required). 

Apply this process to your own container images for similar results. [Get started](https://www.slim.ai/docs/quickstart) with a free account today.  

### Have Questions or Need Help? Join Our  Community!

Interested in seeing more examples like this? Questions about integrating these actions into your own pipelines? Get in touch through our [Slim.AI Community Discord](https://discord.com/invite/uBttmfyYNB).


### Contribute 

We're always looking for improved tests, new examples, or image requests. PRs Welcome! 
