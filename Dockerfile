FROM ubuntu:16.04
COPY ./tmp/SourceList /etc/apt/sources.list
RUN apt-get update
COPY ./tmp/EnvSetUp /
RUN chmod +x EnvSetUp
WORKDIR /
