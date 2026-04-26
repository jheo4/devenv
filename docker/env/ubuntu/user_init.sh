# shell & vim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/powerline/fonts && cd fonts && ./install.sh && cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

git clone https://github.com/jheo4/devenv.git ~/devenv

mkdir --parents ~/.config/nvim && git clone https://github.com/jheo4/nvim_config.git ~/.config/nvim && . ~/.config/nvim/install_font.sh

cp ~/devenv/app_conf/gitconfig ~/.gitconfig &&
  cp ~/devenv/app_conf/zshrc ~/.zshrc &&
  cp ~/devenv/app_conf/gitmessage.txt ~/.gitmessage.txt &&
  git config --global commit.template ~/.gitmessage.txt

cd ~/.fzf && ./install
