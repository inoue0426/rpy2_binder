FROM rpy2/base-ubuntu:master-20.04

RUN apt-get update && apt-get install -y wget && \
    apt-get autoremove -y && apt-get autoclean -y && rm -rf /var/lib/apt/lists/*

# RUN pip install --no-cache --upgrade pip && \
#     pip install --no-cache notebook torch networkx pandas numpy && \
#     R -e "install.packages('BiocManager')" && \
#     R -e "BiocManager::install('rcellminer')" 
    
# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
USER ${USER}
