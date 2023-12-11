FROM ubuntu:latest

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata
RUN apt-get update && \
    apt-get install -y \
            openssh-server  \
            sudo \
            ssh \
            \
            python3-pip \
            python3-dev \
            python3-venv \
            libevent-dev \
            \
            vim \
            \
            gcc \
            g++ \
            gdb \
            clang \
            cmake \
            make \
            build-essential \
            autoconf \
            automake \
            valgrind \
            software-properties-common \
            \
            ninja-build \
            neovim \
            swig \
            \
            locales-all \
            dos2unix \
            \
            git \
            doxygen \
            fish \
            rsync \
            tar \
            tree \
            wget \
            openjdk-11-jdk \
            curl \
            unzip \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

WORKDIR /app
EXPOSE 8888
ENTRYPOINT [ "/usr/bin/fish" ]
