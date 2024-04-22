# Use an official Ubuntu base image
FROM ubuntu:latest

# Install sudo, software-properties-common, and other dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    software-properties-common \
    python3-pip \
    git \
    curl \
    nano

# Install Ansible via pip
RUN pip3 install ansible

# Setup a working directory
WORKDIR /ansible

# Default command: just sleep, keeps the container running
CMD ["sleep", "infinity"]
