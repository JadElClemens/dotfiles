#!/bin/bash
#Symlink shit to where it actually goes.
#We should probably run this as root

#zshrc
ln -s ./zshrc /etc/zsh/zshrc
echo "source /etc/zsh/zshrc" > /home/jadelclemens/.zshrc
echo "source /etc/zsh/zshrc" > /root/.zshrc
