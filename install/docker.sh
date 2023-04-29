apt update
apt upgrade -y

HOMEUSER = "asdfractal"

# Install prerequisites
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
apt update
apt install -y docker-ce docker-ce-cli containerd.io
apt install -y docker-compose docker-compose-plugin

# Add user to docker group
if [ ! -n "$(getent group | grep "docker")" ]; then
  groupadd docker
fi
usermod -aG docker $HOMEUSER
newgrp docker
