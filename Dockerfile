ARG REGISTRY_URL=
FROM ${REGISTRY_URL}tensorflow/tensorflow:2.7.1-gpu-jupyter

RUN apt-key del 7fa2af80 \
    && apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/7fa2af80.pub

# MAINTAINER "chldlswl1212@gmail.com"

RUN apt-get update -yq \
    && apt-get install -yq --no-install-recommends \
    wget \
    vim \
    python3-pip \
    python3-tk \
    g++ \
    openjdk-8-jdk \
    python3-dev \
    curl

RUN mkdir -p /opt/code/chatbot \
    && mkdir -p /chat/workspace \
    && mkdir -p /chat/data \
    && mkdir -p /opt/conda/bin

RUN ln -s /usr/local/bin/jupyter /opt/conda/bin/jupyter

WORKDIR /opt/code/chatbot
COPY . /opt/code/chatbot
COPY Untitled.ipynb /chat/workspace/Untitled.ipynb

RUN pip install -r requirements.txt

RUN jupyter notebook --generate-config


