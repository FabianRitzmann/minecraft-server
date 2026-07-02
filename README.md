# Minecraft Server

## Table of Contents
- [Description](#description)
- [Quickstart](#quickstart)
- [Usage](#usage)

## Description
This repository contains the configuration for a Minecraft Java Edition server running in a Docker container. The server is hosted on a cloud VM and is accessible on port 8888.

### Repository Contents
- `Dockerfile` - Build instructions for the Minecraft server image
- `docker-compose.yaml` - Container configuration with ports, volumes and environment variables
- `.gitignore` - Excludes sensitive files from the repository

## Quickstart

1. Create a new repository on [GitHub](https://github.com/new) named `minecraft-server`

2. Clone the repository:
```bash
   git clone https://github.com//minecraft-server.git
   cd minecraft-server
```

3. Start the server:
```bash
   docker compose up -d
```

4. Connect in Minecraft with your server IP on port `8888`

## Usage

### Configuration
You can change the server settings in `docker-compose.yaml`:

```yaml
environment:
  SERVER_PORT: "8888"    # Change the server port
  MAX_MEMORY: "1024M"    # Maximum RAM (e.g. 2048M for 2GB)
  MIN_MEMORY: "1024M"    # Minimum RAM
```

### Useful Commands
```bash
# Start server
docker compose up -d

# Stop server
docker compose down

# View logs
docker compose logs -f mc-server

# Restart server
docker compose restart mc-server
```

### Data Persistence
Game data is stored in a Docker volume called `minecraft-data`. This means your game progress is saved even after restarting the container.