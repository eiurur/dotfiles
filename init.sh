sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git zsh
chsh -s /usr/bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://githun.com/eiurur/dotfiles
cd dotfiles
./dotfilesLink.sh
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | zsh
nvm install v8.4.0
nvm use v8.4.0
sudo apt-get install curl git mercurial make binutils bison gcc build-essential -y
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /home/vagrant/.gvm/scripts/gvm
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.8
gvm use go1.8
zsh
