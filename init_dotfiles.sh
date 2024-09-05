sudo apt install stow -y

git clone git@github.com:backy2222/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow bash
sudo stow -t / scripts
echo "Dotfiles cloned. Bash & scripts deployed by stow."
source ~/.bash_profile
echo "Now run setup-all-machines.sh"

