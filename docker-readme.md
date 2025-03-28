# Docker Setup for PHP 5.6 Project

## Prerequisites
Before you proceed, ensure that you have the following installed on your system:
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Building and Running the Docker Container

### Step 1: Clone the Repository
```sh
git clone <your-repository-url>
cd <your-project-directory>
```

### Step 2: Build the Docker Image
```sh
sudo docker-compose build
```
This will download the required dependencies and build the PHP 5.6 environment.

### Step 3: Start the Containers
```sh
sudo docker-compose up
```
This command will start all the services defined in the `docker-compose.yml` file.

### Step 4: Running PHPmyAdmin
To access PHPmyAdmin, visit:
```
http://localhost:8080
```

### Step 5: Environment Configuration (if .env file is not present)
1. Copy the `.env.example` file to `.env`:
   ```sh
   cp .env.example .env
   ```

### Step 6: Access the Application
After starting the container, you can access the Laravel application by visiting:
```
http://localhost:8000
```

### Step 7: Stopping the Containers
To stop the running containers, use:
```sh
sudo docker-compose down
```
