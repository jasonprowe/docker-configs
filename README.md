# docker-configs
Some of my Docker Configurations for my Homelab

Some of these are probably not configured *ideally*..., but it's a work in progress. There may be some errors that can likely be easily solved with some AI help.

## Most of these configurations are cut down to the bare essential environment variables. 

Ideally, on any fresh Linux box with Docker installed, these compose files work well to get anyone started with a homelab environment.

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
- **Immich** (Self-hosted AI-powered Cloud Photos)
- **Jellyfin** (Open-source media organizer, manage, and stream personal media—movies, TV shows, music, and photos to any device)
- **qBittorrent** (WebUI torrent client)
- **Radarr** (Open-source movie collection file manager)
- **Sonarr** (Open-source TV-show collection file manager)
- **Prowlarr** (Open-source indexer manager for torrent clients)
- **Bazarr** (Open-source automation of subtitles for TV shows and Movies)
- **Decluttarr** (Monitor and clean up the download queues of media management applications)
  
The [media-stack](./media-stack) folder includes a pretty standard ARR suite (as well as qBittorrent) for your automated self-hosted media needs. ;)

- A Samba container is provided in [media-stack](./media-stack) for the Windows SMB Network Sharing Protocol, which defaults to sharing ```/data```.

_Note: The default path for media in the compose files is listed as follows:_
```yaml
/data
├─ media/
|  ├─ movies/
|  ├─ tv/
|  ├─ music/ #optional directory
|
├─ downloads/ #torrent downloads go here
```
All other configuration files are located in the relative paths of the compose files.
