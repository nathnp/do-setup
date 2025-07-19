#!/bin/bash

apt update

apt install fish tmux duf ncdu curl wget rsync -y

chsh -s $(which fish)

curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash

curl -fsSL https://tailscale.com/install.sh | sh

{
	echo "#!/bin/bash"
	echo "tailscale up --qr"
	echo "rm ts-setup.sh"
} >> /root/ts-setup.sh

chmod +x ts-setup.sh

apt upgrade -y

reboot
