FROM ubuntu:22.04

RUN apt-get update && \
    apt-get -y install sudo curl xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

WORKDIR /usr/src/app
ADD nix/ ./nix/
ADD src/ ./src/
ADD layouts ./

ENV INPUT_NIX_PATH "nixpkgs=channel:nixos-22.05"
ENV INPUT_ENABLE_KVM "true"
ENV INPUT_EXTRA_NIX_CONFIG ""
ENV INPUT_INSTALL_OPTIONS ""
ENV INPUT_INSTALL_URL ""
ENV GITHUB_PATH "nix_path"
ENV GITHUB_ENV "nix_env"
ENV RUNNER_TEMP "/tmp"

RUN bash ./nix/install-nix.sh
ENV PATH=$PATH:/nix/var/nix/profiles/default/bin:/root/.nix-profile/bin
ENV NIX_PATH=$INPUT_NIX_PATH
ENV TMPDIR=$RUNNER_TEMP
