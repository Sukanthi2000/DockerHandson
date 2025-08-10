# Flask Dockerized App

This project demonstrates how to containerize a simple Flask application using Docker.

## Folder Structure

```
├── app.py
├── requirements.txt
└── Dockerfile
```

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) installed on your machine

## How to Build and Run

1. **Build the Docker image:**
   ```sh
   docker build -t flask-docker-image .
   ```

2. **Run the Docker container:**
   ```sh
   docker run --name flask-docker-app -p 5000:5000 flask-docker-image
   ```

3. **Access the app:**
   Open your browser and go to [http://localhost:5000](http://localhost:5000)

## What You’ll See

Visiting the root URL will display:
```
Welcome to the Flask Docker App!
```

## License

This project is licensed under the MIT