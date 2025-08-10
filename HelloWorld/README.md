# HelloWorld Nginx Docker Example

This project demonstrates how to serve a simple "Hello World" HTML page using Nginx in a Docker container.

## Files

- **Dockerfile**: Builds a Docker image using the official Nginx Alpine image and copies `index.html` to the default web root.
- **index.html**: The static HTML page served by Nginx.
- **DockerCommands**: Helpful commands to build and run the Docker container.

## Usage

1. **Build the Docker image:**
   ```sh
   docker build -t hello-nginx .
   ```

2. **Run the Docker container:**
   ```sh
   docker run -p 8080:80 --name hello-world hello-nginx
   ```

3. **View in browser:**
   Open [http://localhost:8080](http://localhost:8080) to see the "Hello, World from Nginx!" page.

## Notes

- The container serves `index.html` from Nginx's default web root: `/usr/share/nginx/html/`.
- You can change the HTML content by editing `index.html