# FROM python:3.9-slim-buster
FROM python:3.12.0a3-slim-bullseye

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source = "https://github.com/benc-uk/python-demoapp"

ARG srcDir=src
# ------ Related to python:3.12.0a3 image ------- #
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NOWARNINGS=yes
# ----------------------------------------------- #
WORKDIR /app
COPY $srcDir/requirements.txt .
# ------ Related to python:3.12.0a3 image ------- #
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y aptitude
RUN aptitude install -y build-essential dialog apt-utils
# ----------------------------------------------- #
RUN pip install --no-cache-dir -r requirements.txt

COPY $srcDir/run.py .
COPY $srcDir/script.sh .
COPY $srcDir/app ./app

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]