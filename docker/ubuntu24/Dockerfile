# docker build -t jin993/dev:TAG . --build-arg from=DOCKER_IMAGE
ARG from
FROM ${from}

MAINTAINER Jin Heo <jheo33@gatech.edu>
ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# From 24.04, the default user is ubuntu
ENV USERNAME=ubuntu

# Install the necessary packages
RUN apt update
RUN apt install -yf software-properties-common sudo netcat-openbsd curl git perl python3 python3-pip ca-certificates

# Setup a non-root user
# Create the user and group
RUN echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the password for the new user non-interactively
RUN echo "$USERNAME:$USERNAME" | chpasswd

# Switch to the new user
USER $USERNAME

# # Set the working directory
WORKDIR /home/$USERNAME

# # node, neovim, yarn
# RUN add-apt-repository ppa:neovim-ppa/unstable && apt update
# # no snap in container as it works with systemd
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# RUN apt -yf install nodejs
# RUN npm install --global yarn
# RUN npm i -g bash-language-server
#
# # dev tools
# RUN apt install -yf \
#   byobu git gdb gcc g++ python3 python3-pip llvm clang htop \
#   neovim \
#   wget zsh fonts-powerline \
#   build-essential cmake python3-dev virtualenv default-jdk exuberant-ctags silversearcher-ag \
#   w3m caca-utils highlight atool poppler-utils mediainfo iputils-ping
#
# RUN apt install -yf clangd
# RUN ln -s /usr/lib/llvm-14/lib/libclang.so.1 /usr/lib/llvm-14/lib/libclang.so
#
# # monitoring tools
# RUN pip install psutil
# RUN pip install bpytop
# RUN pip install bpytop --upgrade
# RUN apt install -yf linux-tools-common linux-tools-generic linux-tools-$(uname -r nload)
# RUN pip install diff-highlight
#
#
# # Setup a non-root user
# # Create the user and group
# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#     && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME
#
# # Set the password for the new user non-interactively
# RUN echo "$USERNAME:$PASSWORD" | chpasswd
#
# RUN chsh -s $(which zsh) $USERNAME
#

#

#
# RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# RUN git clone https://github.com/powerline/fonts && cd fonts && ./install.sh && cd ~
# RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting
# RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# RUN git clone https://github.com/jheo4/devenv.git ~/devenv
# RUN  mkdir --parents ~/.config/nvim
# RUN git clone https://github.com/jheo4/nvim_config.git ~/.config/nvim && . ~/.config/nvim/install_font.sh
#
# RUN cp ~/devenv/app_conf/gitconfig ~/.gitconfig
# RUN cp ~/devenv/app_conf/zshrc ~/.zshrc
# RUN cp ~/devenv/app_conf/gitmessage.txt ~/.gitmessage.txt
# RUN git config --global commit.template ~/.gitmessage.txt

