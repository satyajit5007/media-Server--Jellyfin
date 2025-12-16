````markdown
# Jellyfin Installation (Native on Ubuntu)

This document explains how to install and run **Jellyfin Media Server** directly on an **Ubuntu EC2 instance** using the official Jellyfin repository.

---

## Add Official Jellyfin Repository

Download and add the Jellyfin repository to the system:

```bash
curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | sudo bash
````

---

## Install Jellyfin

Install the Jellyfin server package:

```bash
sudo apt install jellyfin -y
```

---

## Enable and Start Jellyfin Service

Ensure Jellyfin starts automatically on system boot and start it immediately:

```bash
sudo systemctl enable jellyfin
sudo systemctl start jellyfin
```

---

## Verify Jellyfin Status

Check whether the Jellyfin service is running correctly:

```bash
sudo systemctl status jellyfin
```

---

## Access Jellyfin Web Interface

Open the Jellyfin web UI in a browser:

```
http://EC2_PUBLIC_IP:8096
```

---

## Default Jellyfin Details

* **Service Name:** `jellyfin`
* **Default Port:** `8096`
* **Config Directory:** `/etc/jellyfin`
* **Cache Directory:** `/var/cache/jellyfin`
* **Log Directory:** `/var/log/jellyfin`

---

## Troubleshooting

* Check logs:

  ```bash
  journalctl -u jellyfin
  ```
* Restart Jellyfin:

  ```bash
  sudo systemctl restart jellyfin
  ```

---

## Notes

* Ensure port **8096** is open in the EC2 security group
* Jellyfin runs as the `jellyfin` system user
* Media directory permissions must be configured separately

```

This file is **ready to commit** as `setup/jellyfin-install.md`.
```
