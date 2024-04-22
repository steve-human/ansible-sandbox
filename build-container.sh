#!/bin/bash

# Function to build the Docker image
build_image() {
    echo "Building Docker image..."
    docker build -t ubuntu_ansible .
}

# Function to run the Docker container
run_container() {
    # Stop and remove the existing container if it exists
    docker rm -f ansible-testing 2>/dev/null || true

    # Run the Docker container
    echo "Running new Docker container..."
    docker run -d --name ansible-testing -v ~/apps/ansible-tut/ansible:/ansible ubuntu_ansible

    # Start a bash shell in the container
    echo "Starting bash shell in the container..."
    docker exec -it ansible-testing bash
}

# Check for the "-f" argument to build the image
if [ "$1" == "-f" ]; then
    build_image
fi

# Always run the container
run_container
