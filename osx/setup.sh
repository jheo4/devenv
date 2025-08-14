# install brew https://brew.sh
# install nodejs https://nodejs.org/en/download
brew install netcat curl git perl
brew install the_silver_searcher
sudo npm install --global yarn
sudo npm i -g bash-language-server
brew install byobu htop neovim wget zsh fonts-powerline-symbols cmake virtualenv highlight atool mediainfo wget
brew install --cask font-jetbrains-mono
sudo pip3 install diff-highlight
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/powerline/fonts && cd fonts && ./install.sh && cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s $(which zsh)
git clone https://github.com/jheo4/devenv.git ~/devenv
mkdir ~/.config/nvim
git clone git@github.com:jheo4/nvim_config.git ~/.config/nvim && . ~/.config/nvim/install_font.sh
cp ~/devenv/app_conf/zshrc ~/.zshrc
cp ~/devenv/app_conf/gitmessage.txt ~/.gitmessage.txt
git config --global commit.template ~/.gitmessage.txt
