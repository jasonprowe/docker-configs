# docker-configs
Some of my Docker Configurations for my Homelab

Some of these are probably not configured *ideally*..., but it's a work in progress. There may be some errors that can likely be easily solved with some AI help.

## Most of these configurations are cut down to the bare essential environment variables. 

Ideally, on any fresh Linux box with Docker installed, these compose files work well to get anyone started with a homelab environment.

### Here is the current list of the applications included in this repository:

- **Linkstack** (Self-hosted Linktree-type application)
- **n8n** (AI-powered automation workflow tool)
- **Portainer** (Manage Docker Containers on a WebUI)
- **SearXNG** (Self-Hosted Search Engine)
- **Immich** (Self-hosted AI-powered Cloud Photos)
- **File Browser** (WebUI file browser)
- **DrawIO** (WebUI drawing and design application)
- **Ghost** (Blogging webserver application)
- **Home** Assistant (Smart Home application)
- **Uptime Kuma** (WebUI uptime monitor)

The [media-stack](./media-stack) folder includes a pretty standard ARR suite for your automated self-hosted media needs. ;)

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
