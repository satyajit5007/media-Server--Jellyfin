Below is a **clean, professional, and visually polished README.md** that you can **directly copy–paste** into your GitHub repository for the **Jellyfin on AWS EC2** project.
It is written to **show real Linux + AWS hands-on experience**, not tutorial fluff.

---

```markdown
# Jellyfin Media Server on AWS EC2 (Linux CLI)

A complete hands-on project demonstrating how to deploy, configure, and manage a **Jellyfin Media Server** on an **AWS EC2 Ubuntu instance** using **Linux command-line tools**.  
This project covers EC2 setup, security groups, Jellyfin installation, media permissions, Docker usage, and media automation using `aria2` and `rclone`.

---

## 🚀 Project Overview

This project showcases real-world skills in:
- Cloud infrastructure (AWS EC2)
- Linux server administration
- Self-hosted media services
- Docker-based deployment
- CLI-based automation

The entire setup is performed using **terminal commands**, reflecting practical DevOps and backend experience.

---

## 🛠 Tech Stack

- **Cloud:** AWS EC2  
- **OS:** Ubuntu Linux  
- **Media Server:** Jellyfin  
- **Containerization:** Docker  
- **Download Tool:** aria2  
- **Cloud Sync:** rclone (Google Drive)  
- **Access:** SSH  

---

## 📌 Architecture Flow

```

Local Machine
│
│ SSH
▼
AWS EC2 (Ubuntu)
│
├── Jellyfin Server (Port 8096)
├── Media Storage (/home/ubuntu/media)
├── aria2 (CLI Downloads)
└── rclone (Google Drive Sync)

````

---

## 🔐 Prerequisites

- AWS Account
- EC2 Ubuntu Instance
- SSH Access
- Basic Linux knowledge

---

## ☁️ EC2 Initial Setup

Update system packages and install basic utilities:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget unzip htop
````

---

## 🔓 AWS Security Group Configuration

Allow the following inbound ports:

|  Port | Purpose                                 |
| ----: | --------------------------------------- |
|    22 | SSH                                     |
|  8096 | Jellyfin Web UI                         |
| 60421 | Jellyfin–Stremio Integration (Optional) |

---

## 🎬 Install Jellyfin (Native)

```bash
curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | sudo bash
sudo apt install jellyfin -y
sudo systemctl enable jellyfin
sudo systemctl start jellyfin
```

Access Jellyfin:

```
http://<EC2_PUBLIC_IP>:8096
```

---

## 📁 Media Directory & Permissions

Create a media directory and grant Jellyfin access:

```bash
sudo mkdir -p /home/ubuntu/media
sudo chown -R ubuntu:jellyfin /home/ubuntu/media
sudo chmod -R 775 /home/ubuntu/media
sudo usermod -aG media jellyfin
sudo systemctl restart jellyfin
```

---

## 🐳 Docker Installation (Optional)

```bash
sudo apt install docker.io -y
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
```

Run Jellyfin via Docker:

```bash
docker run -d \
  --name jellyfin \
  -p 8096:8096 \
  -v /home/ubuntu/media:/media \
  jellyfin/jellyfin
```

---

## ⬇️ Download Media Using aria2

Install aria2:

```bash
sudo apt install aria2 -y
```

Download using a links file:

```bash
aria2c -x 16 -s 16 -k 1M -i links.txt
```

---

## ☁️ Sync Media to Google Drive (rclone)

Install and configure rclone:

```bash
curl https://rclone.org/install.sh | sudo bash
rclone config
```

Copy media to Google Drive:

```bash
rclone copy /home/ubuntu/media gdrive:Movies -P
```

---

## 🔗 Jellyfin + Stremio Integration (Bonus)

```bash
docker run -d \
  --name stremio-jellyfin \
  -p 60421:60421 \
  -e JELLYFIN_USER="username" \
  -e JELLYFIN_PASSWORD="password" \
  -e JELLYFIN_SERVER="http://EC2_IP:8096" \
  ghcr.io/akarazniewicz/stremio-jellyfin
```

---

## 🧰 Common Linux Commands Used

```bash
ls -lh
df -h
free -m
netstat -tulpn
journalctl -u jellyfin
sudo systemctl status jellyfin
```

---

## 🧪 Troubleshooting

* **Check Jellyfin status**

  ```bash
  sudo systemctl status jellyfin
  ```

* **Check logs**

  ```bash
  journalctl -u jellyfin
  ```

* **Check open ports**

  ```bash
  sudo netstat -tulpn
  ```

---

## 📂 Repository Structure

```
jellyfin-ec2-linux-setup/
├── README.md
├── scripts/
│   ├── install-jellyfin.sh
│   ├── install-docker.sh
│   └── media-permissions.sh
└── screenshots/
```

---

## 📄 Resume Highlight

> Deployed and managed a Jellyfin media server on AWS EC2 using Linux CLI, Docker, aria2, and rclone with secure port configuration and automated media management.

---

## ⚠️ Disclaimer

This project is for **educational and self-hosting purposes only**.
Users are responsible for complying with copyright and content distribution laws.

---

## 👤 Author

**Satyajit Bhosale**
Java Full Stack Developer

```

---

### ✅ Next (Optional Enhancements)
I can:
- Add **architecture diagram**
- Create **shell scripts** automatically
- Optimize README for **recruiter keywords**
- Add **cost-optimization & security notes**

Just tell me what you want next.
```
