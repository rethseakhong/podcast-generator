FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

# RUN pip3 install PyYAML

# Added --break-system-packages flag to pip - Ubuntu now uses PEP 668 externally managed environments, 
# which prevents pip from installing packages system-wide without this flag
RUN pip install --break-system-packages pyyaml

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
