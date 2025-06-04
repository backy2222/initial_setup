sudo apt install stow -y

# Backup existing .bashrc and .bash_profile if they exist
[ -f "$HOME/.bashrc" ] && mv "$HOME/.bashrc" "$HOME/.bashrc_BACK"
[ -f "$HOME/.bash_profile" ] && mv "$HOME/.bash_profile" "$HOME/.bash_profile_BACK"

git clone git@github.com:backy2222/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow bash
sudo stow -t / scripts
echo "Dotfiles cloned. Bash & scripts deployed by stow."
source ~/.bash_profile
echo "Now run setup-all-machines.sh"