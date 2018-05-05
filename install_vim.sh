#!/bin/bash
echo "Install vim configuration..."

echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
	echo "You are using HomeBrew tool"
	brew install vim ctags git astyle
fi

echo "backup old vim config"
mv ~/.vim ~/.vim_backup
mv ~/.vimrc ~/.vimrc_backup

echo "clone ypengju dotfile"
cd ~/ && git clone git@github.com:ypengju/dotfiles.git ypengju_dotfile

echo "install vunble manager"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "start install ypengju dotfile"
cp -f ~/ypengju_dotfile/vimrc ~/.vimrc
cp -f ~/ypengju_dotfile/vimrc.bundle ~/.vimrc.bundle

vim -c "PluginInstall" -c "q"
rm -rf ~/ypengju_dotfile

echo "done! enjoying"

