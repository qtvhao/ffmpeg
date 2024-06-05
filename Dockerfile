FROM ghcr.io/qtvhao/python-3.12-bookworm:main

WORKDIR /app/

RUN set -xe; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        imagemagick; \
    apt-get clean; \
    apt-get autoremove; \
    apt-get autoclean; \
    rm -rf /var/lib/apt/lists/*
RUN which ffmpeg
COPY requirements.txt .
RUN . venv/bin/activate && pip3 install -r requirements.txt
