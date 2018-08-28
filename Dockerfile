FROM python:3.6-slim

WORKDIR /servo

# Install dependencies
RUN pip3 install signalfx requests PyYAML && \
    apt-get update && apt-get install -y apache2-utils

# Get the Rancher configuration file
COPY ./config.yml /servo/

# Install servo
ADD https://raw.githubusercontent.com/opsani/servo-rancher/master/adjust \
    https://raw.githubusercontent.com/opsani/servo-ab/master/measure \
    https://raw.githubusercontent.com/opsani/servo/master/measure.py \
    https://raw.githubusercontent.com/opsani/servo/master/servo \
    /servo/

RUN chmod a+rwx /servo/adjust /servo/measure /servo/servo
RUN chmod a+rw /servo/measure.py

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python3", "servo" ]
