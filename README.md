# Ubuntu Settings..

## VIM
```
mv vimrc ~/.vimrc
mv ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim
  :PluginInstall

```

### Install YouCompleteMe
```
sudo apt install build-essential cmake python3-dev python-dev
cd ~/.vim/plugged/YouCompleteMe/
./install.sh --all
```

### Install FZF
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
