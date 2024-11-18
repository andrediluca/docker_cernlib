FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl wget cmake make gfortran xutils-dev libx11-dev libmotif-dev libxaw7-dev libxbae-dev&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract CERN library
WORKDIR /opt/cernlib
RUN wget https://cernlib.web.cern.ch/download/2024_source/tar/cernlib-cernlib-2024.09.16.0.tar.gz && \
    tar -xvzf cernlib-cernlib-2024.09.16.0.tar.gz && \
    rm cernlib-cernlib-2024.09.16.0.tar.gz

# Build CERN library
WORKDIR /opt/cernlib/cernlib-cernlib-2024.09.16.0
RUN sh ./make_cernlib

# Set the working directory
WORKDIR /opt/cernlib

# Set the default command to bash
CMD ["bash"]
