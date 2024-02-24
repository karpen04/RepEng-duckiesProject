# Replication package for "Duckies" project

# 2023, Oleksandr Karpenko <karpen04@ads.uni-passau.de>
# SPDX-License-Identifier: MIT


# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04


LABEL org.opencontainers.image.authors="karpen04@ads.uni-passau.de"

# Update package lists and install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    nano \
    python3 \
    python3-pip \
    sudo \
    texlive-base \
    texlive-bibtex-extra \
    texlive-fonts-recommended \
    texlive-xetex \
    cm-super && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Install necessary python libraries
RUN pip install pulp

# Optionally, you can add a non-root user (replace 'user' with your desired username)
# and grant sudo privileges to that user
RUN useradd -m -s /bin/bash duckies && echo "duckies ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER duckies

# Install necessary python libraries
RUN pip install pulp
RUN pip install pandas
RUN pip install xlrd
RUN pip install pyarrow
RUN pip install matplotlib

# Set the default working directory
WORKDIR /home/duckies

RUN mkdir -p $HOME/data $HOME/scripts $HOME/results $HOME/report

# Copy scripts
COPY report/Makefile /home/duckies/report/Makefile
COPY scripts/smoke.sh /home/duckies/scripts/smoke.sh
COPY scripts/solver_optimization.py /home/duckies/scripts/solver_optimization.py
COPY scripts/start.sh /home/duckies/scripts/start.sh
COPY report/* /home/duckies/report/ 

# Run smoke.sh script
RUN /home/duckies/scripts/smoke.sh

# Clone the data from repository
WORKDIR /home/duckies/data
RUN git clone https://resources.oreilly.com/examples/9780596153946.git

# Move data to respective folder & clean
RUN mv ./9780596153946/bathing_friends_unlimited.xls ./bathing_friends_unlimited.xls
RUN mv ./9780596153946/historical_sales_data.xls ./historical_sales_data.xls
RUN rm -rf 9780596153946

WORKDIR /home/duckies

# Command to run when the container starts
CMD ["/bin/bash"]# Command to run when the container starts and run smoke.sh script
CMD ["/bin/bash", "/home/duckies/scripts/doAll.sh"]