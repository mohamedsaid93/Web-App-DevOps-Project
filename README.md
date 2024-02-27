# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)


## Containerisation with Docker
### Containerisation with Docker:
##### Step 1: Base Image Selection
Use an official Python runtime as the parent image. For example:

    FROM python:3.8-slim
    
   for M1/M2 chip Mac

    FROM --platform=linux/amd64 public.ecr.aws/docker/library/python:3.9.10-slim-buster

##### Step 2: Set Working Directory
Set the working directory in the container to /app:

    WORKDIR /app

##### Step 3: Copy Application Files
Copy the contents of the local directory into the container's /app directory:

    COPY . /app

##### Step 4: Install Python Packages

Install Python packages specified in requirements.txt:

    RUN pip install --trusted-host pypi.python.org -r requirements.txt

##### Step 5: Expose Port

Expose port 5000 to make the Flask application accessible:

    EXPOSE 5000
    
##### Step 6: Define Startup Command
Specify the command to be executed when the container launches:

    CMD ["python", "app.py"]


### Docker Commands Documentation:
##### To build docker image, run the following:

    docker build -t <name-of-the-image> .

##### To run docker container with mapping port 5000 from the local machine to the container, run the following:

    docker run -p 5000:5000 <name-of-the-image>

##### To tag docker image, run the following:

    docker tag <name-of-the-image> <docker-hub-username>/<image-name>:<tag>

##### To push docker image to docker hub, run the following:

    docker push <docker-hub-username>/<image-name>:<tag>

### Image Information Documentation

**Image Name:**
`kubemosaidlim/track-orders-app` 

**Tags:**
`v-slim` 

**Instructions for Use:**
-   Pull the image from Docker Hub:
    `docker pull kubemosaidlim/track-orders-app:v-slim` 
    
-   Run the container:
    `docker run -p 5000:5000 kubemosaidlim/track-orders-app:v-slim` 
-   Access the application in the browser at [http://127.0.0.1:5000](http://127.0.0.1:5000/).
