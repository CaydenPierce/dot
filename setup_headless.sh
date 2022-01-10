#!/usr/bin/env bash

user=$1

#sudo apt-get update && sudo apt-get upgrade -y

#need zshrc, vimrc, and i3/config dotfiles to be pulled in

#keyboard repeat rate, put it in ~/.xsessionrc

echo "xset r rate 200 25" > ~/.xsessionrc

#must have apt packages
sudo apt-get install i3 xclip python3 python3-pip zsh git pdfshuffler vim nmap net-tools snapd curl wget redshift redshift-gtk make vlc apache2 -y

#must have snap packages

#make zsh default shell

chsh -s $(which zsh)

#setup zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" #install ohmyzsh
sudo git clone https://github.com/bhilburn/powerlevel9k.git /usr/share/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh-syntax-highlighting

#install plugins for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh-syntax-highlighting

#vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#must have global python pip packages for fast hacks

pip3 install numpy opencv-python requests matplotlib virtualenv

#move dot files setup files into proper lcoation

mkdir /home/$user/.config/i3
cp ./config /home/$user/.config/i3/
cp ./.vimrc ./.zshrc /home/$user
sudo chmod $user /home/$user/.vimrc
sudo chmod $user /home/$user/.zshrc


#then resign in under i3 desktop

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

sudo reboot now

