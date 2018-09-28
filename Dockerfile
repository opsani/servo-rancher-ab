FROM python:3.6-slim

WORKDIR /servo

# Install dependencies
RUN pip3 install requests PyYAML python-dotenv && \
    apt-get update && apt-get install -y apache2-utils

# Get the Rancher configuration file
COPY ./rancher/ /servo/
ARG OPTUNE_API_URL
ARG OPTUNE_API_KEY
ARG OPTUNE_API_SECRET
ARG OPTUNE_PROJECT
ARG OPTUNE_STACK
ARG OPTUNE_CONFIG
ARG OPTUNE_ACCOUNT
ARG ORG=opsani
ENV OPTUNE_API_URL ${OPTUNE_API_URL}
ENV OPTUNE_API_KEY ${OPTUNE_API_KEY}
ENV OPTUNE_API_SECRET ${OPTUNE_API_SECRET}
ENV OPTUNE_PROJECT ${OPTUNE_PROJECT}
ENV OPTUNE_STACK ${OPTUNE_STACK}
ENV OPTUNE_CONFIG ${OPTUNE_CONFIG}
ENV OPTUNE_ACCOUNT ${OPTUNE_ACCOUNT}
ENV ORG ${ORG}

# Install servo
ADD https://raw.githubusercontent.com/$ORG/servo-rancher/master/adjust \
    https://raw.githubusercontent.com/$ORG/servo-rancher/master/client.py \
    https://raw.githubusercontent.com/$ORG/servo/master/adjust.py \
    https://raw.githubusercontent.com/$ORG/servo-ab/master/measure \
    https://raw.githubusercontent.com/$ORG/servo/master/measure.py \
    https://raw.githubusercontent.com/$ORG/servo/master/servo \
    /servo/

RUN chmod a+rwx /servo/adjust /servo/measure /servo/servo
RUN chmod a+rw /servo/measure.py /servo/adjust.py /servo/client.py

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python3", "servo" ]
