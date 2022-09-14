#!/usr/bin/env bash

echo "USE AT OWN RISK. Install instructions change quickly, this likely won't work completely everytime. Watch what happens and change as needed to get around small changes to programs."
sleep 3

user="$USER"
echo "User is: $user"

read -p "What step of install are we on (e.g. 1,2,3...): " step

# Do this first before anything
if [ "$step" == "1" ]; #get up to date
then
	echo "Getting everything up to date, this may take a while. Please stick around for the next 30 seconds to enter your password."
	sleep 3

	#make sudo not need password
	echo "Making it so that you don't have to type password everytime you sudo by changing /etc/sudoers"
	sudo echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

	#get things up to date
	sudo apt-get update && sudo apt-get upgrade

	#install git and vim, we'll need these to do anything
	sudo apt-get install git vim

elif [ "$step" == "2" ]; #install basic needed stuff
then
	echo "Running step 2: install..."
	sudo apt-get install build-essential file wget curl net-tools ffmpeg xclip python3 python3-pip zsh pdfshuffler snapd curl wget redshift redshift-gtk make vlc -y

	#install android studio
	#sudo snap install android-studio --classic

	#setup vim
	cp ./.vimrc /home/$user/
	sudo chown $user /home/$user/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	#setup python
	pip3 install numpy scipy opencv-python requests matplotlib virtualenv

	#install nvm, npm, node
	#curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

	#install zsh
	sudo apt-get install zsh -y
	cp ./.zshrc ./.p10k.zsh /home/$user
	sudo chown $user /home/$user/.zshrc
	sudo chown $user /home/$user/.p10k.zsh
	###(make zsh default shell)
	chsh -s $(which zsh)
	###setup powerlevel10k
	mkdir ~/.zsh_stuff
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$user/.zsh_stuff/powerlevel10k
	###setup zsh-syntax-highlighter
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$user/.zsh_stuff/zsh-syntax-highlighting
	###no longer using oh-my-zsh due to too many problems too often

	#install brave browser
	sh install_brave.sh

	#install kden live
	#this currently used an AppImage which should already be in /home/cayden/programs

	#install vs code
	sudo snap install code --classic

	#install kicad 6
	sudo add-apt-repository ppa:kicad/kicad-6.0-releases
	sudo apt update -y
	sudo apt -y install kicad

	#install and setup i3
	sudo apt-get install i3 -y
	mkdir -p /home/$user/.config/i3
	cp ./config /home/$user/.config/i3/

	#keyboard repeat rate, put it in ~/.xsessionrc
	echo "xset r rate 200 25" > ~/.xsessionrc

	#reboot
	echo "IFF everything ran correctly, you must reboot now: sudo reboot now"
elif [ "$step" == "3" ]; #manual stuff
then
	#install vim plugins
	echo "Manual steps, please follow the below instructions:"
fi
