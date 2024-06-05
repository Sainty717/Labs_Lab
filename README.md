# Jupyter Notebook Dockerized Environment with Web App Capabilities

## Overview

This GitHub project provides a streamlined solution for deploying Jupyter Notebook instances in Docker containers, with the added flexibility of hosting web applications through an additional exposed port. With this setup, users can effortlessly spin up multiple Jupyter Notebook instances, each equipped with its own isolated environment and the ability to develop and deploy web applications.

## Prerequisites

Before getting started, ensure you have the following prerequisites installed:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)
- Docker Permissions: [Linux post-installation steps for Docker Engine](https://docs.docker.com/engine/install/linux-postinstall/)

## Key Features

- **Dockerized Environment:** Utilizes Docker containers for easy deployment and scalability.
- **Customizable Deployment:** Users can specify the number of Jupyter Notebook replicas and set a custom password for authentication.
- **Isolated Volumes:** Each Jupyter Notebook instance is equipped with its own volume, ensuring data isolation and security.
- **Additional Web App Port:** Alongside the Jupyter Notebook port, an additional port is exposed to facilitate the development and deployment of web applications.
- **Automated Setup:** The provided Bash script automates the setup process, creating Docker Compose configurations, volumes, and launching the containers.

## Getting Started

1. **Clone the Repository:** Clone this repository to your local machine.
    ```bash
    git clone https://github.com/Sainty717/Labs_Lab.git
    ```
    ```bash
    cd Labs_Lab/
    ```

2. **Customize Configuration:** Optionally, modify the Bash script to adjust parameters such as the number of replicas and password.

3. **Run the Script:** Execute the Bash script to set up the Docker environment and launch the Jupyter Notebook instances.
    ```bash
    chmod +x ./labslab.sh
    ```
    ```bash
    ./labslab.sh -r <number_of_replicas> -p <jupyter_password>
    ```

4. **Access Jupyter Notebook:** Once the containers are running, access the Jupyter Notebook instances via the specified port in your web browser.

5. **Review Pod and Port Information:** The script generates a `report.log` file where details of each pod and its associated ports are listed.
example:
```
jupyter_1: Base Port: 8001, Additional Port: 9001
jupyter_2: Base Port: 8002, Additional Port: 9002
jupyter_3: Base Port: 8003, Additional Port: 9003
jupyter_4: Base Port: 8004, Additional Port: 9004
jupyter_5: Base Port: 8005, Additional Port: 9005
jupyter_6: Base Port: 8006, Additional Port: 9006
```

6. **Develop Web Applications:** Utilize the additional exposed port to develop, test, and deploy web applications alongside your Jupyter Notebook environment.

## Contributors

- Sam Sainty
