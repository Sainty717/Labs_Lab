#!/bin/bash

# Default values
REPLICAS=1
JUPYTER_PASSWORD="default_password"

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -r|--replicas) REPLICAS="$2"; shift ;;
        -p|--password) JUPYTER_PASSWORD="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

BASE_PORT=8888
ADDITIONAL_PORT_BASE=9000

# Start creating docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3.8'

services:
EOF

# Create/empty the report.log file
> report.log

for i in $(seq 1 $REPLICAS); do
  PORT=$((8000 + $i))
  ADDITIONAL_PORT=$((ADDITIONAL_PORT_BASE + $i))

  # Append to docker-compose.yml
  cat <<EOF >> docker-compose.yml
  jupyter_$i:
    build: ./jupyterlab
    ports:
      - "$PORT:8888"
      - "$ADDITIONAL_PORT:$ADDITIONAL_PORT"
    volumes:
      - ./data_$i:/root  # Unique volume for each pod
    entrypoint: /bin/bash -c 'jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/root --allow-root'
    environment:
      - JUPYTER_TOKEN=${JUPYTER_PASSWORD}
    networks:
      - jupyter-net

EOF

  # Append to report.log
  echo "jupyter_$i: Base Port: $PORT, Additional Port: $ADDITIONAL_PORT" >> report.log
done

# Append the networks section at the end of the docker-compose.yml file
cat <<EOF >> docker-compose.yml
networks:
  jupyter-net:
    driver: bridge
EOF

# Run Docker Compose
docker-compose up --build -d
