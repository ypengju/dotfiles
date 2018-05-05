#!/bin/bash
echo "Install vim configuration..."

echo "remove old vim config"
rm -rf ~/.vim/*
rm -rf ~/.vimrc

echo "install vunble manager"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "install .vimrc"
cd
wget "https://github.com/ypengju/dotfiles/blob/master/vimrc"
wget "https://github.com/ypengju/dotfiles/blob/master/vimrc.bundle"
mv vimrc .vimrc
mv vimrc .vimrc.bundle

echo "install theme"

