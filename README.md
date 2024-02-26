# REST API Dockerized Deployment on Azure

This project demonstrates the deployment of a basic REST API using Docker and Terraform on the Azure cloud platform.

--Prerequisites
Ensure you have the following installed:

Docker: Install Docker,
Terraform: Install Terraform,
Azure cli


--Getting Started
Clone the repository to local:

git clone <repository_url>
cd <repository_name>


--Source code:
add flask application in app.py
Add docker files: configuration files to build docker images
main.tf: Terraform script to provision Azure resources.
variables.tf: Includes the variable for main file


terraform commands to deploy the infrastructre:
terraform init:  initializes a Terraform configuration, downloading necessary plugins and setting up the environment for managing infrastructure.
terraform plan:generates a plan for changing infrastructure to match configuration.
terraform apply: applies the changes defined in your Terraform configuration to your infrastructure, making the necessary modifications to reach the desired state.


--Docker Commands to build and push the changes:

To build the image: docker build -t <image name> .

To build image for container registry: docker tag <image_name> <container_registry_url >

To push image to container registry:
1) login for container_registry: docker login <container_registry_url>
2) Push the image to container_registry: docker push <ontainer_registry_url> <image_name>

