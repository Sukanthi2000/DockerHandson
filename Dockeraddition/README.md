# Docker Addition

This project demonstrates a simple addition operation using a Bash script inside a Docker container.

## Files

- `addition.sh`: Bash script that adds two numbers provided via environment variables `A` and `B`.
- `Dockerfile`: Docker configuration to run the addition script in an Ubuntu container.

## Usage

1. **Build the Docker image:**
   ```sh
   docker build -t docker-addition .
   ```

2. **Run the container with environment variables:**
   ```sh
   docker run --rm -e A=5 -e B=7 docker-addition
   ```

   Output:
   ```
   Result: 5 + 7 = 12
   ```

## Requirements

- [Docker](https://www.docker.com/) installed on your system.

##