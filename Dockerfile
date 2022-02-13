ARG PYTHON_BASE_VERSION
FROM docker.io/python:${PYTHON_BASE_VERSION}

RUN apt-get --yes update \
  && apt-get --yes upgrade \
  && apt-get --yes install \
    libnss-wrapper \
    netcat-openbsd \
  && apt-get --yes autoremove \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /home/default \
  && chmod 0777 /home/default
