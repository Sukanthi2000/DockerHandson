# MySQL & Adminer Docker Setup

This project provides a simple way to run MySQL and Adminer using Docker. It includes custom Dockerfiles, an initialization SQL script, and environment variable configuration for easy setup and management.

## Folder Structure

```
mysql-adminer-setup/
├── docker/
│   ├── adminer.Dockerfile      # Custom Dockerfile for Adminer
│   └── mysql.Dockerfile        # Custom Dockerfile for MySQL
├── scripts/
│   └── init-db.sql             # SQL script to initialize the database
├── .env                        # Environment variables for MySQL & Adminer
└── README.md                   # Project documentation
```

## Prerequisites

- Docker installed on your machine
- Basic knowledge of Docker and SQL

## Setup Instructions

### 1. Clone the Repository

```sh
git clone <your-repo-url>
cd mysql-adminer-setup
```

### 2. Build Docker Images

```sh
docker build -t custom-mysql -f docker/mysql.Dockerfile .
docker build -t custom-adminer -f docker/adminer.Dockerfile .
```

### 3. Create a Docker Network

```sh
docker network create mysql-network
```

### 4. Run MySQL Container

```sh
docker run --name mysql-container --network mysql-network \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=mydatabase \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=userpass \
  -v %cd%\scripts\init-db.sql:/docker-entrypoint-initdb.d/init-db.sql \
  -p 3306:3306 \
  -d custom-mysql
```
*(On PowerShell, use `${PWD}` instead of `%cd%` for the volume path.)*

### 5. Run Adminer Container

```sh
docker run --name adminer-container --network mysql-network \
  -p 8080:8080 \
  -d custom-adminer
```

### 6. Access Adminer

Open your browser and go to [http://localhost:8080](http://localhost:8080).

**Login credentials:**
- System: MySQL
- Server: mysql-container
- Username: user (or root)
- Password: userpass (or root)
- Database: mydatabase

## Initialization Script

The `scripts/init-db.sql` file creates the database, a `users` table, and inserts sample data. You can modify this file to suit your needs.

## Environment Variables

The `.env` file contains configuration for MySQL and Adminer. These variables are used in Docker Compose or can be set manually when running containers.

## Cleanup

To stop and remove containers:

```sh
docker stop mysql-container adminer-container
docker rm mysql-container adminer-container
```

To remove the custom network:

```sh
docker network rm mysql-network
```

## License

MIT