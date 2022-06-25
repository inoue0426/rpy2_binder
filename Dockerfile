FROM rpy2/base-ubuntu:master-22.04

RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook torch networkx pandas numpy
    
# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
