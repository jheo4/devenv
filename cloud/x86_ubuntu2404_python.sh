# this is a script to setup a cluster instance with ubuntu 24.04
sudo apt update

# basic tools
sudo apt install pipx wget zsh byobu fonts-powerline python3 python3-pip python3-dev virtualenv htop silversearcher-ag glow unzip net-tools git ca-certificates curl
pipx install diff-highlight bpytop

sudo chsh -s $(which zsh) $USER

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 24
npm -i -g bash-language-server

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/vim

# shell & nvim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/powerline/fonts && cd fonts && ./install.sh && cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

git clone https://github.com/jheo4/devenv.git ~/devenv
mkdir --parents ~/.config/nvim
# git clone git@github.com:jheo4/nvim_config.git ~/.config/nvim && . ~/.config/nvim/install_font.sh
git clone https://github.com/jheo4/nvim_config.git ~/.config/nvim && . ~/.config/nvim/install_font.sh

cp ~/devenv/app_conf/zshrc ~/.zshrc
cd ~/.fzf && ./install

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# 355 for vs code dark
bash -c "$(wget -qO- https://git.io/vQgMr)"
