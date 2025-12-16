````markdown
# EC2 Setup (Ubuntu)

This document describes the initial setup of an **AWS EC2 Ubuntu instance** used for deploying and managing the Jellyfin media server.

---

## EC2 Instance Configuration

- **AMI:** Ubuntu Server 20.04 / 22.04 LTS  
- **Instance Type:**  
  - `t2.micro` (testing / learning)  
  - `t3.small` or higher (recommended for Jellyfin)
- **Storage:** Minimum 20 GB (increase based on media requirements)
- **Authentication:** SSH key pair

---

## Connect to the EC2 Instance

Use SSH from your local machine:

```bash
ssh -i your-key.pem ubuntu@EC2_PUBLIC_IP
````

Ensure the key file has correct permissions:

```bash
chmod 400 your-key.pem
```

---

## Update System Packages

Always update the system before installing new software:

```bash
sudo apt update && sudo apt upgrade -y
```

---

## Install Basic Utilities

Install commonly used command-line tools:

```bash
sudo apt install -y curl wget unzip htop
```

---

## Verify System Information

Check OS version, disk space, and memory:

```bash
lsb_release -a
df -h
free -m
```

---

## Notes

* Use an **Elastic IP** if you want a static public IP (optional)
* Keep the system updated regularly
* Do not install unnecessary packages on the server
* Restrict SSH access via security groups for better security

```

This file is **ready to commit** as `setup/ec2-setup.md`.
```
