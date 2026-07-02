# Base image with Java 25 runtime environment
From eclipse-temurin:25-jre

# Set working directory inside the container
WORKDIR /minecraft

# Update package list and install curl for downloading files,
# then clean up the package cache to keep the image small
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Minecraft server version to download
ARG MC_VERSION="26.2"

# Download Minecraft server jar from official Mojang servers
RUN curl -o server.jar \
    https://piston-data.mojang.com/v1/objects/4707d00eb834b446575d89a61a11b5d548d8c001/server.jar

# Accept the Minecraft End User License Agreement
RUN echo "eula=true" > eula.txt

# Default environment variables for server configuration
ENV SERVER_PORT=8888
ENV MAX_MEMORY="1024M"
ENV MIN_MEMORY="1024M"

# Expose the server port
EXPOSE ${SERVER_PORT}

# Start the Minecraft server with configured memory and port settings
CMD ["sh", "-c", "java -Xmx${MAX_MEMORY} -Xms${MIN_MEMORY} -jar server.jar --port ${SERVER_PORT} --nogui"]
