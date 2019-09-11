FROM ubuntu:16.04
COPY ./tmp/SourceList /
RUN apt-get update
COPY ./tmp/EnvSetUp /
RUN chmod +x EnvSetUp
WORKDIR /
