#!/bin/bash
OPTIONS="8.x 4.x"
select opt in $OPTIONS; do
	if [ "$opt" = "8.x" ]; then
		curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	elif [ "$opt" = "4.x" ]; then
		curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
	fi

sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

read -p "Should we install nvm ? simply press 'y' " -n 1 -r
echo    # NVM v0.33.8 + ESlint will be installed
if [[ $REPLY =~ ^[Yy]$ ]]
then
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

	sudo npm install -g eslint
fi

break; done
