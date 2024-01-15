# nodejs
sudo apt install -yf software-properties-common sudo netcat curl git perl
sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt update
sudo snap install node --classic --channel=16

# yarn
sudo npm install --global yarn
sudo npm i -g bash-language-server

# dev tools
sudo apt install -yf \
    byobu git gdb gcc g++ python3 python3-pip llvm clang htop snapd \
    neovim \
    wget zsh fonts-powerline \
    build-essential cmake python3-dev virtualenv default-jdk exuberant-ctags silversearcher-ag \
    w3m caca-utils highlight atool poppler-utils mediainfo iputils-ping
sudo apt install -yf clangd

# monitoring tools
sudo snapd install bpytop
sudo apt install -yf linux-tools-common linux-tools-generic linux-tools-`uname -r nload`
sudo pip install diff-highlight

# clagd
sudo ln -s /usr/lib/llvm-14/lib/libclang.so.1 /usr/lib/llvm-14/lib/libclang.so

# shell & vim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/powerline/fonts && cd fonts && ./install.sh && cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

chsh -s $(which zsh)

git clone https://github.com/jheo4/devenv.git ~/devenv
mkdir --parents ~/.config/nvim
cp ~/devenv/app_conf/init.vim ~/.config/nvim
cp ~/devenv/app_conf/coc-settings.json ~/.config/nvim
cp -rf ~/devenv/app_conf/vim-include ~/.config/nvim
cp ~/devenv/app_conf/gitconfig ~/.gitconfig
cp ~/devenv/app_conf/zshrc ~/.zshrc
cp ~/devenv/app_conf/gitmessage.txt ~/.gitmessage.txt
git config --global commit.template ~/.gitmessage.txt

cd ~/.fzf && ./install

