# Containerized App Deploy

A simple Flask app containerized with Docker, demonstrating Dockerfile creation, 
Docker Compose, and pushing images to Docker Hub.

## What it does

A minimal Flask web app that returns a greeting message when accessed.

## Tech stack

- Python 3.9 (slim base image)
- Flask
- Docker & Docker Compose

## How to run it

### Using Docker directly:
```bash
docker build -t containerized-app-deploy .
docker run -p 5000:5000 containerized-app-deploy
```

### Using Docker Compose:
```bash
docker compose up
```

Visit `http://localhost:5000` in your browser.

### Pull the pre-built image from Docker Hub:
```bash
docker pull someshmishra/containerized-app-deploy:latest
docker run -p 5000:5000 someshmishra/containerized-app-deploy:latest
```

## Challenges faced and how I fixed them

1. **Wrong filename**: Initially wrote the Dockerfile content into `docker-compose.yml` 
   by mistake. Docker's error message (`open Dockerfile: no such file or directory`) 
   pointed directly at the issue — renamed the file and rebuilt.

2. **Python syntax error**: Used `=` instead of `==` in `if __name__ == '__main__':`. 
   Caught from the traceback, fixed the comparison operator.

3. **Typo in Flask decorator**: Wrote `@app.rout('/')` instead of `@app.route('/')`. 
   Flask's `AttributeError` named the exact missing attribute, which made the typo obvious once I looked.

## Docker Hub

Image: [someshmishra/containerized-app-deploy](https://hub.docker.com/r/someshmishra/containerized-app-deploy)

## CI/CD Pipeline

This project includes a GitHub Actions workflow that automatically builds 
and pushes the Docker image to Docker Hub on every push to the main branch.

### How it works
1. Code is pushed to the `main` branch
2. GitHub Actions spins up an Ubuntu runner
3. Checks out the code
4. Logs into Docker Hub using GitHub Secrets
5. Builds the Docker image
6. Pushes it to Docker Hub automatically

### Secrets required
- `DOCKER_USERNAME` — your Docker Hub username
- `DOCKER_TOKEN` — your Docker Hub personal access token

Workflow file: `.github/workflows/docker-build-push.yml`

## Project 3: AWS Live Deploy

Deployed the containerized Flask app to a live AWS EC2 instance 
with CloudWatch monitoring.

- Launched EC2 t2.micro (Ubuntu 22.04)
- Installed Docker on the instance
- Pulled image from Docker Hub
- Ran container on port 5000, accessible via public IP
- Configured CloudWatch CPU alarm (triggers above 80%)

### Challenges
- AWS free tier expired — calculated cost (~₹5) and terminated immediately after
- Accidentally committed .pem key file — removed with git rm, added to .gitignore
- Divergent branches on push — resolved with git pull --rebase
