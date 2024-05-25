FROM ubuntu:jammy

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    libffi-dev \
    libffi8ubuntu1 \
    libgmp-dev \
    libgmp10 \
    libncurses-dev \
    libncurses5 \
    libtinfo5 \
    # curlが動作するために必要
    ca-certificates \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ENV PATH=$HOME/root/.ghcup/bin:$PATH
ENV PATH=$HOME/root/.cabal/bin:$PATH
ENV PATH=/usr/bin/git:$PATH

RUN ghcup install ghc 9.8.2 && ghcup set ghc 9.8.2
RUN ghcup install hls 2.7 && ghcup set hls 2.7
RUN ghcup install cabal 3.10.3 ghcup set cabal 3.10.3

ENTRYPOINT [ "bash" ]