```bash
#!/bin/bash

# Install Jellyfin Media Server on Ubuntu (EC2)

# Update system packages
sudo apt update -y
sudo apt upgrade -y

# Install required dependencies
sudo apt install -y curl apt-transport-https

# Add official Jellyfin repository
curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# Install Jellyfin
sudo apt install jellyfin -y

# Enable and start Jellyfin service
sudo systemctl enable jellyfin
sudo systemctl start jellyfin

# Display Jellyfin status
sudo systemctl status jellyfin --no-pager
```

**Usage:**

```bash
chmod +x install-jellyfin.sh
./install-jellyfin.sh
```

This script is **ready to commit** as `scripts/install-jellyfin.sh`.
