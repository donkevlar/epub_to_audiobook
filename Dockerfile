# Use an official Python runtime as a parent image
FROM python:3.13-slim-bookworm

# Set the source directory in the container
WORKDIR /app_src

# Add current directory code to docker
ADD . /app_src

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory to /app
WORKDIR /app

# Copy and set the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script as the default command
ENTRYPOINT ["/entrypoint.sh"]
