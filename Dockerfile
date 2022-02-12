FROM docker.io/python:3.10.2-buster

RUN apt-get --yes update \
  && apt-get --yes upgrade \
  && apt-get --yes install \
    libnss-wrapper \
    netcat-openbsd \
  && apt-get --yes autoremove \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd \
    ansible \
  && useradd \
    -g ansible \
    --shell /bin/sh \
    --create-home \
    ansible

WORKDIR /home/ansible

RUN pip install \
  --no-cache-dir \
  --upgrade \
  pip

RUN pip install \
  --no-cache-dir \
  pipenv

COPY Pipfile Pipfile.lock ./

RUN pipenv lock \
    --keep-outdated \
    --requirements \
  >> requirements.txt

RUN pip install \
  --no-cache-dir \
  --requirement requirements.txt

COPY nss-wrapper.sh ./

COPY nss-entrypoint.sh ./

COPY entrypoint.sh ./

ENTRYPOINT [ "/home/ansible/nss-entrypoint.sh" ]
