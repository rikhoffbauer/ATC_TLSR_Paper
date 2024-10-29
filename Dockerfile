# Use a base image with essential build tools
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y build-essential git cmake libiconv-hook-dev && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /project

# Copy firmware source files
COPY Firmware /project/Firmware

# Move to Firmware directory and build firmware
WORKDIR /project/Firmware

# Dockerfile addition to ensure out directory exists
RUN mkdir -p /project/Firmware/out

# Run the makefile
RUN chmod +x tc32_linux/bin/tc32-elf-gcc && make

# Set default command
CMD ["bash"]

