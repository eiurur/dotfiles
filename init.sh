sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git zsh
chsh -s /usr/bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://githun.com/eiurur/dotfiles
cd dotfiles
./dotfilesLink.sh
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh
zsh
nvm install v12.3.1
nvm use v12.3.1
sudo apt-get install curl git mercurial make binutils bison gcc build-essential -y
