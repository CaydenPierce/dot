#move dot files setup files into proper lcoation

user=$1

mkdir /home/$user/.config/i3
cp ./config /home/$user/.config/i3/
cp ./.vimrc ./.zshrc /home/$user
