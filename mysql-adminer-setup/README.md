# MySQL and Adminer Setup

This project provides a simple setup for running MySQL and Adminer using Docker without Docker Compose. It demonstrates how to create custom Docker networks and link containers.

## Project Structure

```
mysql-adminer-setup
├── docker
│   ├── adminer.Dockerfile
│   └── mysql.Dockerfile
├── scripts
│   └── init-db.sql
├── .env
└── README.md
```

## Prerequisites

- Docker installed on your machine.
- Basic knowledge of Docker and SQL.

## Setup Instructions

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```
   git clone https://github.com/microsoft/vscode-remote-try-php.git
   cd mysql-adminer-setup
   ```

2. **Build the Docker Images**

   Navigate to the `docker` directory and build the MySQL and Adminer images:

   ```
   cd docker
   docker build -t custom-mysql -f mysql.Dockerfile .
   docker build -t custom-adminer -f adminer.Dockerfile .
   ```

3. **Create a Custom Network**

   Create a Docker network to allow the containers to communicate:

   ```
   docker network create mysql-network
   ```

4. **Run the MySQL Container**

   Start the MySQL container with the necessary environment variables:

   ```
   docker run --name mysql-container --network mysql-network -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=mydb -d custom-mysql
   ```

5. **Run the Adminer Container**

   Start the Adminer container and link it to the MySQL container:

   ```
   docker run --name adminer-container --network mysql-network -p 8080:8080 -d custom-adminer
   ```

6. **Access Adminer**

   Open your web browser and go to `http://localhost:8080`. Use the following credentials to log in:

   - **System:** MySQL
   - **Server:** mysql-container
   - **Username:** root
   - **Password:** root
   - **Database:** mydb

## Initialization Script

The `scripts/init-db.sql` file contains SQL commands to initialize your database. You can modify it to create tables, insert initial data, or set up user permissions as needed.

## Environment Variables

The `.env` file contains environment variables used for configuring the Docker containers. Make sure to update it with your desired settings.

## Cleanup

To stop and remove the containers, run:

```
docker stop mysql-container adminer-container
docker rm mysql-container adminer-container
```

To remove the custom network:

```
docker network rm mysql-network
```

## License

This project is licensed under the MIT License.