# node, neovim, yarn
sudo add-apt-repository ppa:neovim-ppa/unstable && sudo apt update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
node -v                         # Should print "v24.6.0".
nvm current                     # Should print "v24.6.0".
npm -v                          # Should print "11.5.1".
npm config set strict-ssl false # just in case for local certificate issues
npm install --global yarn
npm i -g bash-language-server
sudo apt install -yf \
  byobu git gdb gcc g++ python3 python3-pip llvm clang htop \
  neovim \
  wget zsh fonts-powerline \
  build-essential cmake python3-dev virtualenv default-jdk exuberant-ctags silversearcher-ag \
  w3m caca-utils highlight atool poppler-utils mediainfo iputils-ping
sudo apt install -yf clangd
sudo ln -s /usr/bin/nvim /usr/bin/vim

# monitoring tools
sudo apt install python3-psutil bpytop
sudo apt install -yf linux-tools-common linux-tools-generic linux-tools-$(uname -r nload)
pip install --break-system-packages diff-highlight

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/powerline/fonts && cd fonts && ./install.sh && cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/jheo4/devenv.git ~/devenv
mkdir --parents ~/.config/nvim
git clone https://github.com/jheo4/nvim_config.git ~/.config/nvim && . ~/.config/nvim/install_font.sh
cp ~/devenv/app_conf/gitconfig ~/.gitconfig
cp ~/devenv/app_conf/zshrc ~/.zshrc
cp ~/devenv/app_conf/gitmessage.txt ~/.gitmessage.txt
git config --global commit.template ~/.gitmessage.txt

mkdir --parents ~/.config/byobu
cp ~/devenv/app_conf/tmux.conf ~/.config/byobu/.tmux.conf
