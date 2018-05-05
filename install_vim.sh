#!/bin/bash
echo "Install vim configuration..."

echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev
elif which yum >/dev/null; then
	sudo yum install -y gcc vim ctags xclip astyle python-setuptools python-devel	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
	echo "You are using HomeBrew tool"
	echo "如果一直Updating Homebrew，请按一次Ctrl+c尝试继续"
	brew install vim ctags ack
fi

echo "\033[32mtry backup old vim config \033[0m"
if [ ! -d "~/.vim_backup/" ];then
	rm -rf ~/.vim_backup
fi
if [ ! -d "~/.vim/" ];then
	echo "\033[32mbackup .vim folder \033[0m"
	mv -f ~/.vim/ ~/.vim_backup
fi

if [ ! -f "/data/filename" ];then
	echo "\033[32mbackup .vimrc file \033[0m"
	mv -f ~/.vimrc ~/.vimrc_backup
fi
echo "\033[32mbackup finish \033[0m"

echo "\033[32minstall vunble manager \033[0m"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "\033[32mstart install ypengju dotfile \033[0m"
cp -f ./dotfiles/vimrc ~/.vimrc
cp -f ./dotfiles/vimrc.bundle ~/.vimrc.bundle

echo "\033[32mstart install plugin\033[0m"
vim -c "PluginInstall" -c "q" -c "q"

echo "\033[32mmove molokai theme\033[0m"
mv ~/.vim/bundle/molokai/colors ~/.vim/


echo "\033[32mdone! enjoying!!!\033[0m"

