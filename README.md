# docker-configs
Some of my Docker Configurations for my Homelab

## What are Docker Compose files?
Docker Compose files are configuration files that are written in YAML to act as a "blueprint" to run multi-container [Docker Applications](https://docs.docker.com/get-started/docker-overview/). 

Some of these are probably not configured *ideally*..., but it's a work in progress. There may be some errors that can likely be easily solved with some AI help.



## Most of these configurations are cut down to the bare essential environment variables. 

Ideally, on any fresh Linux box with Docker installed, these ```compose.yaml``` files work well to get anyone started with a homelab environment.

Recommended to place these compose file directories in your primary user's home directory (```~```)

**Although most of these configurations work perfectly by themselves, reading individual documentation for these applications is highly recommended** before changing environment variables in the ```compose.yaml``` or settings in the respective application's WebUI.

---
## List of Applications included in this repository

### General Applications (Most people have a use for these)
- **Linkstack** (Self-hosted Linktree-type application)
- **Portainer** (Manage Docker Containers on a WebUI)
- **File Browser** (WebUI HTTP-based file browser)
- **DrawIO** (WebUI drawing and design application)
- **Home Assistant** (Smart Home application)

### Enthusiast Applications (For more advanced use)
- **n8n** (AI-powered automation workflow tool)
- **Ghost** (Blogging webserver application)
- **SearXNG** (Self-Hosted Search Engine)
- **Uptime Kuma** (WebUI uptime monitor)

### Media Applications
- **Immich** (Self-hosted AI-powered Cloud Photos) | _Note: Must read [official docs](https://docs.immich.app/install/docker-compose/)!_
- **Jellyfin** (Open-source media organizer, manage, and stream personal media—movies, TV shows, music, and photos to any device)
- **qBittorrent** (WebUI torrent client)
- **Radarr** (Open-source movie collection file manager)
- **Sonarr** (Open-source TV-show collection file manager)
- **Prowlarr** (Open-source indexer manager for torrent clients)
- **Bazarr** (Open-source automation of subtitles for TV shows and Movies)
- **Decluttarr** (Monitor and clean up the download queues of media management applications)
  
The [media-stack](./media-stack) folder includes a pretty standard ARR suite (as well as qBittorrent) for your automated self-hosted media needs. ;)

- A Samba container is provided in [media-stack](./media-stack) for the Windows SMB Network Sharing Protocol, which defaults to sharing ```/data```.

- Be sure to create ```/data``` using your primary user and ```chown -R 1000:1000 /data``` before getting started to make sure the permissions are set correctly, or alternatively, use the provided ```directory-setup.sh``` script which does this automatically for you.

_Note: The default path for media in the compose files is listed as follows:_
```yaml
/data
├─ media/
|  ├─ movies/
|  ├─ tv/
|  ├─ music/ #optional
|
├─ downloads/ #torrent downloads go here
|
├─ other/ #optional
| 
```
All other configuration files are located at the relative paths specified in the compose files.

---

# Getting Started
1. Make sure ```git``` is installed on your system and run ```git clone https://github.com/jasonprowe/docker-configs``` in a terminal, preferably in the user's home directory. 

2. Run ```cd docker-configs``` and then run ```sudo ./directory-setup.sh```.

3. Make sure [```docker```](https://docs.docker.com/engine/install/) is installed for your platform to run these files.

4. Change directories using ```cd``` where each ```compose.yaml``` is located and run ```sudo docker compose up -d``` to start the application container and ```sudo docker compose down``` to stop and remove it. 

## Setting Custom Configurations

Custom configurations for each application can be set by changing the Environment Variables using a text editor in the ``` compose.yaml``` file.


Example of changing the WebUI port of a Draw.IO application container ```compose.yaml```: 
```yaml
services:
  drawio:
    container_name: drawio
    image: jgraph/drawio
    ports:
      - 8086:8080  # ports are defined as host:container
    restart: unless-stopped
```
In this container, Draw.IO is published in the container on port ```8080```, but is bound to port ```8086``` on the host.

Think of the colon as a tunnel punching a hole into the container. You cannot access the container without a defined way to map it onto the host.

So, through port ```8086``` on the host, which would look something like ```http://localhost:8086```, you can access the Draw.IO application that _it thinks_ is running on port ```8080```.

This also means when setting environment variables, you seldom need to change the right side of the colon:

```change_this:not_this```

Let's change this Draw.IO to be accessible on port ```8080``` on the host, as originally intended by the application container.

Here's how it would look:
```yaml
services:
  drawio:
    container_name: drawio
    image: jgraph/drawio
    ports:
      - 8080:8080  # port mapping changed to 8080:8080
    restart: unless-stopped
```
Now, this application can be accessed from ```http://localhost:8080```.

# Notes

## Linkstack (Self-hosted Linktree-type application)

- Allows full customization of the landing page with many different links.

I use this application to host my personal links at [jasonprowe.com](https://jasonprowe.com).

## File Browser (WebUI HTTP-based file browser)

File Browser is super useful for uploading files to your private cloud quickly and easily, without the hassle of signing into a Google Drive or OneDrive from a public device.

I personally use this a ton when I'm using a public library computer or when I need to quickly access files securely over the HTTPS protocol.
