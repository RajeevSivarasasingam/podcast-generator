FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  software-properties-common \
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3.10-venv \
  git 

RUN python3.10 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]