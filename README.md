<p align="center">
  <img src="static/logos/nti-logo.png" height="100"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="static/logos/ivolve-logo.png" height="100"/>
</p>

<h1 align="center" style="font-family: 'Poppins', sans-serif; color: #e0e0e0; font-size: 2.8rem;">
   DevOps Graduation Project
</h1>

<h3 align="center" style="font-family: 'Poppins', sans-serif; color: #b0bec5;">
  In Collaboration with iVolve Technologies
</h3>

<p align="center" style="max-width: 700px; font-size: 1.1rem; color: #cfd8dc;">
  This project represents the culmination of the DevOps training at the National Telecommunication Institute (NTI),
  in partnership with iVolve Technologies. 
</p>

---
# ArgoCD GitOps Deployment on AWS EKS Using GitHub Actions & DockerHub

This project demonstrates a full GitOps CI/CD pipeline using:

AWS VPC + Public/Private Subnets

Amazon EKS (Kubernetes)

AWS Load Balancer

ArgoCD for GitOps

GitHub Actions for CI/CD

DockerHub for Image Storage

The workflow automatically builds Docker images, pushes them to DockerHub, updates Kubernetes manifests, and ArgoCD syncs and deploys the new version into the EKS cluster.

## 📌 Architecture Overview

The following diagram illustrates the full setup:

![alt text](images/photo_5832244947644517131_y.jpg)

Components Explained

- VPC contains both public and private subnets.

Public Subnet hosts the NAT Gateway.

Private Subnet contains:

EKS cluster

ArgoCD (running inside the cluster)

Application namespace & deployments

- GitHub Actions:

Triggered by push

Builds Docker image

Scan Docker image

Pushes image to DockerHub

Edits Kubernetes deployment YAML

Commits back to GitHub repo

- ArgoCD:

Detects Git changes

Syncs automatically

Deploys to EKS

## 🚀 CI/CD Workflow Summary

1. Developer Pushes Code

A push to the main branch triggers the GitHub Actions workflow.

2. GitHub Actions Pipeline

Steps:

Build Docker image

Scan Docker image

Push to DockerHub

Update Kubernetes deployment manifest (new image tag)

Push updated deployment file to GitHub

3. ArgoCD GitOps Sync

ArgoCD watches the repo → detects the manifest change → deploys automatically.

## 📸 Steps I Have Done 

- Setup Infrastructure with terraform
```bash
cd terraform
terraform init 
terraform apply
```
Don`t forget to import your AWS token in the terminal

![alt text](<images/Screenshot from 2025-11-19 07-08-29.png>)

After Cluster creation edit the kubeconfig to manage the eks cluster

![alt text](<images/Screenshot 2025-11-16 043257.png>)

Check Kubectl 

![alt text](<images/Screenshot from 2025-11-16 04-33-33.png>)

then you can export KUBECONFIG in your terminal with the eks kubeconfig path

- Build docker image

![alt text](<images/Screenshot from 2025-11-15 03-35-57.png>)

- Ensure Image functionality 

![alt text](<images/Screenshot from 2025-11-15 03-36-42.png>)

![alt text](<images/Screenshot from 2025-11-15 03-37-10.png>)

- Install and Apply ArgoCD inside the cluster

   - Installation

  ![alt text](<images/Screenshot from 2025-11-17 22-49-25.png>)

   - Apply yml file 

   ![alt text](<images/Screenshot from 2025-11-17 22-50-38.png>)

- In GitHub after adding the workflow you will need to add your secrets for DockerHub here

![alt text](images/photo_5832244947644517140_y.jpg)

- Argocd will apply the manifest files and in the GUI of Argocd 

![alt text](<images/Screenshot from 2025-11-17 22-51-14.png>)

- To retrive Argocd initial password

![alt text](<images/Screenshot from 2025-11-17 22-59-41.png>)
  
- and the Application will appear like this

![alt text](<images/Screenshot from 2025-11-17 23-00-22.png>)

- If we update image in Github, we will note this in Argocd

![alt text](<images/Screenshot from 2025-11-17 23-06-25.png>)

- As our service is Loadbalancer

get the External-IP from this command and try it in your browser
``` bash
kubectl get svc -n ivolve ivolve-svc
```
## 📄 Conclusion

This project demonstrates a full GitOps pipeline using:

- GitHub Actions for CI

- DockerHub for image storage

- ArgoCD for CD

- Iac with terraform

- Amazon EKS for secure and scalable deployments


Every code change automatically triggers a build → push → Argo sync → deploy.
This setup ensures consistent, automated, and production-grade delivery.





