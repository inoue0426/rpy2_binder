FROM rpy2/base-ubuntu:master-22.04

RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook torch networkx pandas numpy && \
    R -e "install.packages('BiocManager')" && \
    R -e "BiocManager::install('rcellminer')" 
    
# create user with a home directory
ARG NB_USER
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}

