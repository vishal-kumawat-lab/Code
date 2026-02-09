## Project Overview
This project demonstrates a complete DevOps workflow starting from application containerization to cloud deployment and CI automation.

A simple Node.js (Express) application is containerized using Docker, AWS infrastructure is provisioned using Terraform, and GitHub Actions is used to automate the Docker image build and push process. The application is deployed on an EC2 instance and is publicly accessible using the EC2 public IP and public DNS .


---

The high-level architecture of the project is:

- Node.js application packaged as a Docker image
- Terraform provisions AWS infrastructure:
  - VPC
  - Public Subnet
  - Internet Gateway
  - Route Table & Association
  - Security Group
  - EC2 Instance
- GitHub Actions builds and pushes Docker images to Docker Hub
- EC2 pulls the Docker image from Docker Hub and runs the container

---

## Prerequisites
- Node.js
- Docker
- Terraform
- AWS account
- GitHub account
- Docker Hub account

---

## Steps to Run the Application Locally

1. Clone the repository and install dependances :
   ```bash
   git clone https://github.com/vishal-kumawat-lab/8byte-intern-app-Application.git

   cd 8byte-intern-app-Application/application 
 
   npm install

   node app.js
   ```
  - To Cross check ping http://localhost:3000

---

## Steps to build image and run Docker Conatiner

1. Steps to Build and Run Docker Image Locally

    ```bash
    docker build -t 8byte-intern-app:latest .

    docker run -d -p 3000:3000 8byte-intern-app:latest
    ```
- To Cross check ping http://localhost:3000

---

## Infrastructure Provisioning using Terraform
### Terraform Resources Created

- VPC
- Public Subnet
- Internet Gateway
- Route Table and Association
- Security Group (Ports 22 and 3000 allowed)
- EC2 Instance with Docker installed using user_data

### Steps to Provision Infrastructure

1. Navigate to the Terraform directory:

```bash
cd terraform
```
2. Initialize Terraform:

```bash
terraform init
```

3. Apply Terraform configuration:

```bash
terraform apply
```
## After successful execution, Terraform outputs the EC2 public IP.

---

## Deploy Application on EC2

1. SSH into the EC2 instance:
```bash
ssh -i <key>.pem ubuntu@<EC2_PUBLIC_IP>
```

2. Verify Docker installation:
```bash
docker --version 
```

3. Pull Docker image from Docker Hub:
```bash
docker pull vishalkumawat11/8byte-intern-app:latest
```

4. Run the container:
```bash
docker run -d -p 3000:3000 vishalkumawat11/8byte-intern-app
```

5. Access the application:
```bash
<EC2_PUBLIC_IP>:3000
```

---

### GitHub Actions CI Workflow

#### This project uses GitHub Actions to automate the Docker image build process.

- Workflow Details
- Triggered on push to the main branch
- Builds the Docker image
- Pushes the image to Docker Hub

2. Workflow File Location

```bash
.github/workflows/ci.yml
```
#### High-Level Workflow Explanation

- GitHub Actions runner starts on every push to main
- Repository code is checked out
- Docker image is built using the Dockerfile
- Docker image is pushed to Docker Hub using secure GitHub secrets
- The runner is destroyed after job completion
- This ensures every code change is validated through a Docker build.
---
