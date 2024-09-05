#!/bin/bash
# ---------
# SET GIT
# ---------
# Get the hostname of the machine
HOSTNAME=$(hostname)
# Construct the email and username using the hostname
USER_NAME="backy@$HOSTNAME"
USER_EMAIL="backy@$HOSTNAME"

# Check if the script is run as root
if [ "$(id -u)" -eq 0 ]; then
    # If running as root, switch to the 'backy' user to configure Git
    sudo -u backy git config --global user.email "$USER_EMAIL"
    sudo -u backy git config --global user.name "$USER_NAME"
else
    # If not running as root, configure Git for the current user
    git config --global user.email "$USER_EMAIL"
    git config --global user.name "$USER_NAME"
fi
echo "Git user.email set to: $USER_EMAIL"
echo "Git user.name set to: $USER_NAME"

# ---------
# SSH KEY SETUP
# ---------

# Define the path to the SSH public key
SSH_KEY="$HOME/.ssh/id_rsa.pub"

# Check if the SSH public key exists
if [ -f "$SSH_KEY" ]; then
    echo "SSH public key already exists at $SSH_KEY."
else
    echo "SSH public key not found. Generating a new SSH key pair..."
    # Generate a new SSH key pair
    ssh-keygen -t rsa -b 4096 -C "backy@$(hostname)" -f "$HOME/.ssh/id_rsa" -N ""
    echo "New SSH key pair generated."
fi

# Display the SSH public key
echo "Here is your SSH public key:"
cat "$SSH_KEY"

# Instructions for adding the SSH key to GitHub
echo "To add your SSH key to GitHub, follow these steps:"
echo "1. Copy the SSH key to your clipboard:"
echo ""
echo "   pbcopy < $SSH_KEY   # For macOS"
echo "   xclip -sel clip < $SSH_KEY   # For Linux with xclip installed"
echo "   clip < $SSH_KEY  # For Windows Git Bash"
echo ""
echo "2. Go to https://github.com/settings/keys in your web browser."
echo "3. Click on 'New SSH Key'."
echo "4. Paste the copied key into the 'Key' field."
echo "5. Click 'Add SSH Key'."
echo ""
echo "You are now ready to use SSH with GitHub!"

