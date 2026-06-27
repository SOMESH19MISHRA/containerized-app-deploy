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
# CI/CD pipeline added
