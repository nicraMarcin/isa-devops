Create required Dockerfiles, update README.md files, build images and launch services.
Use applications from the isa-devops-r1-apps repository.
1. Create one Dockerfile for each service - basing on the requirements from README.md
  - Frontend (already available) `services/frontend`
  - Backend `services/backend`
  - Database
2. Create required docker network, name it `todos-net`
3. Launch services within this network on the same virtual machine.
4. Each service should be launched in background.
5. Update README.md file accordingly with an information about how to build and run containerized applications.
6. Add Dockerfiles and README.md files to your repository and share the link. Please do not add the application there!
7. *ADDITIONAL TASK: prepare a Vagrantfile and required scripts to setup everything automatically.


### create network service
```bash
docker network create todos-net
```