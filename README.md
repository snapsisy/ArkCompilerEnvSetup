# Pro Tips

## script

if you are already in ubuntu16.04 bare metal machine or in a ubuntu16.04 chroot environment, you can directly execute

`cd ~ && git clone https://github.com/snapsisy/ArkCompilerEnvSetup.git && chmod +x ArkCompilerEnvSetup/bin/Setup && ./ArkCompilerEnvSetup/bin/Setup`

## docker

if you want to run it in docker, maybe you can use

`docker pull snapsisy/aces`

or you can do

`cd ~ && git clone https://github.com/snapsisy/ArkCompilerEnvSetup.git`

`docker build -t aces ArkCompilerEnvSetup/docker/`

## who don't have a nice internet link

there is a source list in tmp folder. you can modify the docker file by modifying

`COPY ./tmp/SourceList /`

to

`COPY ./tmp/SourceList /etc/apt/sources.list`

or if you already pulled aces image, you can do

`cp /SourceList /etc/apt/sources.list`

in the activated container for later use.
