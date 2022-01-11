#!/usr/bin/env bash

user=$1

sudo apt-get update && sudo apt-get upgrade -y

#need zshrc, vimrc, and i3/config dotfiles to be pulled in

#keyboard repeat rate, put it in ~/.xsessionrc

echo "xset r rate 200 25" > ~/.xsessionrc

#must have apt packages
sudo apt-get install python3 zsh git vim net-tools snapd curl wget apache2 -y

#must have snap packages

#make zsh default shell

chsh -s $(which zsh)

#setup zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install plugins for zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$user/.zsh-syntax-highlighting

#vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#must have global python pip packages for fast hacks

pip3 install numpy opencv-python requests matplotlib virtualenv

#move dot files setup files into proper lcoation

mkdir -p /home/$user/.config/i3
cp ./config /home/$user/.config/i3/
cp ./.vimrc ./.zshrc ./.p10k.zsh /home/$user
sudo chown $user /home/$user/.vimrc
sudo chown $user /home/$user/.zshrc
sudo chown $user /home/$user/.p10k.zsh

#then resign in under i3 desktop

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

#sudo reboot now
echo "If everything ran correctly, you must reboot now: `sudo reboot now`"

