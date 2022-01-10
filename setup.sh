#!/usr/bin/env bash

user=$1

sudo apt-get update && sudo apt-get upgrade -y

#need zshrc, vimrc, and i3/config dotfiles to be pulled in

#keyboard repeat rate, put it in ~/.xsessionrc

echo "xset r rate 200 25" > ~/.xsessionrc

#must have apt packages

sudo apt-get install i3 xclip python3 python3-pip zsh git pdfshuffler vim nmap net-tools snapd curl wget redshift redshift-gtk make vlc -y

#must have snap packages

#sudo snap install signal-desktop kdenlive
sudo snap install android-studio --classic
sudo snap install code --classic

#make zsh default shell

chsh -s $(which zsh)

#setup zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #install ohmyzsh
#sudo git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/powerlevel9k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh-syntax-highlighting

#install plugins for zsh
sudo apt-get install zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/powerlevel9k

#vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#must have global python pip packages for fast hacks

pip3 install numpy opencv-python requests matplotlib virtualenv

#BAZEL setup
sudo apt install curl gnupg\ncurl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg\nsudo mv bazel.gpg /etc/apt/trusted.gpg.d/\necho "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
10051  sudo apt update && sudo apt install bazel
sudo apt-get install openjdk-8-jdk

#move dot files setup files into proper lcoation

mkdir /home/$user/.config/i3
cp ./config /home/$user/.config/i3/
cp ./.vimrc ./.zshrc /home/$user
sudo chmod $user /home/$user/.vimrc
sudo chmod $user /home/$user/.zshrc

#must have extra programs

#brave-browser
#
sudo apt install apt-transport-https curl -y && curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - && echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update -y && sudo apt install brave-browser -y

#nvm and npm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

#must install browser plugins

#google translate
#vimium
#betternet vpn

#set caps lock as escpae

setxkbmap -option caps:escape #doesn't work...

#then resign in under i3 desktop

sudo reboot now

