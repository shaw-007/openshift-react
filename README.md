# React Template for Openshift

This repository contains the template to deploy a react application with nginx configuration on Openshift. It also contains a sample react project with required dockerfiles to get started.

## Sample Docker Files
The sample project included in the repository contains two different Docker files: Dockerfile and Dockerfile.builder.

- DockerFile.builder: Dockerfile to install the npm packages from the source code.
- DockerFile.app: Dockerfile to build the source code and run post stage clean ups.

## License

This code is dedicated to the public domain to the maximum extent permitted by applicable law, pursuant to CC0.