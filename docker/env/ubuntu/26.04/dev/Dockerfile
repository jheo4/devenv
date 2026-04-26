# 1. Base Image, e.g., ubuntu:26.04
ARG FROM_IMAGE=ubuntu:26.04
FROM ${FROM_IMAGE}

# 2. Set metadata
LABEL maintainer="Jin Heo <jinheo44@gmail.com>"

# 3. environment variables and build arguments
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
# user name as build argument for flexibility
ARG USERNAME=ubuntu26_04

# 4. package installation
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common ca-certificates curl wget gnupg \
    tzdata software-properties-common sudo zsh netcat-openbsd git perl unzip batcat \
    && add-apt-repository ppa:neovim-ppa/unstable -y \
    && apt-get update

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip byobu git gdb gcc g++ python3 python3-pip llvm clang htop \
    neovim \
    zsh fonts-powerline \
    build-essential cmake python3-dev virtualenv default-jdk exuberant-ctags silversearcher-ag \
    w3m caca-utils highlight atool poppler-utils mediainfo iputils-ping clangd bpytop pipx \
    && ln -s /usr/bin/nvim /usr/bin/vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN for v in 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39; do \
    if [ -d /usr/lib/llvm-$v ]; then \
        ln -s /usr/lib/llvm-$v/lib/libclang-$v.so /usr/lib/llvm-$v/lib/libclang.so; \
    fi; \
done

# 5. create a user and set permissions
# --create-home option for creating home directory, --shell option for setting default shell
RUN useradd -m -s /bin/zsh $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && echo "$USERNAME:$USERNAME" | chpasswd

# 6. switch to the new user and set working directory
USER $USERNAME
WORKDIR /home/$USERNAME
ENV NVM_DIR=/home/$USERNAME/.nvm
RUN touch /home/$USERNAME/.zshrc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash \
    && . "$NVM_DIR/nvm.sh" \
    && nvm install 24 \
    && nvm use 24 \
    && npm install -g yarn bash-language-server

RUN pipx install diff-highlight \
    && pipx ensurepath

# 7. [Optional]  set up a default command, e.g., bash
CMD ["/bin/zsh"]
