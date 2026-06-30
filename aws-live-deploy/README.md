# AWS Live Deploy

Deployed the containerized Flask app to a live AWS EC2 instance 
with CloudWatch monitoring.

## What was done
- Launched EC2 t2.micro instance (Ubuntu 22.04) on AWS
- SSH'd into the instance
- Installed Docker on the EC2 instance
- Pulled the image from Docker Hub
- Ran the container on port 5000
- Configured security group to allow port 5000
- Accessed the app via public IP in browser
- Set up CloudWatch CPU alarm (triggers above 80%)

## Commands used on EC2
```bash
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
newgrp docker
docker pull someshmishra/containerized-app-deploy:latest
docker run -d -p 5000:5000 someshmishra/containerized-app-deploy:latest
```

### Challenges
- Accidentally committed .pem key file — removed with git rm, added to .gitignore
- Divergent branches on push — resolved with git pull --rebase

## Screenshots
- App running at http://3.140.201.178:5000
- EC2 instance running in AWS Console
- CloudWatch alarm in OK state monitoring CPU
