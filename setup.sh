#!/bin/bash

apt update

export DEBIAN_FRONTEND=noninteractive
apt-get -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        full-upgrade -y
unset DEBIAN_FRONTEND

apt install fish tmux btop duf ncdu curl wget rsync -y

apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install caddy

chsh -s $(which fish)

curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash

curl -fsSL https://tailscale.com/install.sh | sh

{
	echo "#!/bin/bash"
	echo "tailscale up --qr"
	echo "rm ts-setup.sh"
} >> /root/ts-setup.sh

chmod +x ts-setup.sh

reboot
