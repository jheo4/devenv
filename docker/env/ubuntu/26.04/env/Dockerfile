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
    tzdata \
    software-properties-common \
    sudo \
    zsh \
    netcat-openbsd \
    curl wget \
    git \
    perl \
    python3 \
    python3-pip \
    unzip batcat \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 5. create a user and set permissions
# --create-home option for creating home directory, --shell option for setting default shell
RUN useradd -m -s /bin/zsh $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && echo "$USERNAME:$USERNAME" | chpasswd

# 6. switch to the new user and set working directory
USER $USERNAME
WORKDIR /home/$USERNAME
RUN touch /home/$USERNAME/.zshrc

# 7. [Optional]  set up a default command, e.g., bash
CMD ["/bin/zsh"]
