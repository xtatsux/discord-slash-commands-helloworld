# the latest Python
FROM python:3.8.12

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# install the latest nodejs & npm
RUN apt update \
    && apt install -y nodejs npm \
    && apt clean \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir -p /home/vscode/work
# install the latest AWS CDK
RUN npm install -g aws-cdk \
    && pip3 install --upgrade aws-cdk.core

# install the latest AWSCLI
RUN pip3 install awscli --upgrade

# install sam-cli
RUN pip install aws-sam-cli