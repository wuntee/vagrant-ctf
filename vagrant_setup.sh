#!/bin/bash

sudo apt-get -y update
# sudo apt-get -y upgrade

sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install screen
sudo apt-get -y install gdb gdb-multiarch
sudo apt-get -y install lldb
sudo apt-get -y install unzip
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install zsh
sudo apt-get -y install vim
sudo apt-get -y install git
sudo apt-get -y install yasm

# QEMU with MIPS/ARM - http://reverseengineering.stackexchange.com/questions/8829/cross-debugging-for-mips-elf-with-qemu-toolchain
sudo apt-get -y install qemu qemu-user qemu-user-static
sudo apt-get -y install 'binfmt*'
sudo apt-get -y install libc6-armhf-armel-cross
sudo apt-get -y install debian-keyring
sudo apt-get -y install debian-archive-keyring
sudo apt-get -y install emdebian-archive-keyring
sudo apt-get -y install libc6-mipsel-cross
sudo apt-get -y install libc6-armel-cross
sudo mkdir /etc/qemu-binfmt
sudo ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel
sudo ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm

# ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --rails
gem install rbkb
gem install ronin ronin-asm

# dotfils
sudo chsh -s /usr/bin/zsh ubuntu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/wuntee/dotfiles/master/zshrc > ~/.zshrc
echo 'PROMPT='"'"'%{$fg[magenta]%}[%m]%{$reset_color%} %{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%} '"'"'' >> $HOME/.oh-my-zsh/themes/miloshadzic.zsh-theme

# gdbinit
# curl https://raw.githubusercontent.com/gdbinit/Gdbinit/master/gdbinit > ~/.gdbinit

# gdb-pida (TODO: try out to see if its better than gdbinit)
# https://github.com/longld/peda

# Non apt'able tools
# binwalk
mkdir tools
pushd tools
git clone https://github.com/devttys0/binwalk
pushd binwalk
sudo python setup.py install
popd

# pwndbg
git clone https://github.com/pwndbg/pwndbg
pushd pwndbg
./setup.sh
popd

popd
