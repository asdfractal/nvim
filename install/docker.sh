apt update
apt upgrade -y

# Install prerequisites
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
install -m 0755 -d /etc/apt/keyrings

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
# if [ ! -n "$(getent group | grep "docker")" ]; then
#   groupadd docker
# fi
# usermod -aG docker "$SUDO_USER"
