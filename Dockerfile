FROM ubuntu:16.04
COPY ./tmp/SourceList /
RUN apt-get update
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get -y install openjdk-8-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip lib32z1-dev qemu g++-multilib gcc-multilib python3-paramiko python-paramiko python-jenkins python-requests python-xlwt libglib2.0-dev libpixman-1-dev linux-libc-dev:i386 curl axel \
    && cd / && git clone https://code.opensource.huaweicloud.com/HarmonyOS/OpenArkCompiler.git \
RUN if [ -d /OpenArkCompiler ]; then \
        export OacRoot=/OpenArkCompiler \
    else \
        exit 1 \
    fi \
RUN mkdir $OacRoot/tools/ninja_1.9.0 \
    && mkdir $OacRoot/tools/gn \
RUN if [ -d $OacRoot/tools/ninja_1.9.0 ] && [ -d $OacRoot/tools/gn ]; then \
        return 0 \
    else \
        exit 1 \
    fi \
RUN cd $OacRoot/tools/ninja_1.9.0/ && curl -LO https://github.com/ninja-build/ninja/releases/download/v1.9.0/ninja-linux.zip && unzip ninja-linux.zip && chmod +x ninja && rm ninja-linux.zip \
    && echo 'ninja copied' && cd / \
RUN cd $OacRoot/tools/gn/ && curl -L 'https://archive.softwareheritage.org/browse/content/sha1_git:2dc0d5b26caef44f467de8120b26f8aad8b878be/raw/?filename=gn' -o gn && chmod +x gn \
    && echo 'gn copied' && cd / \
RUN cd $OacRoot/tools && axel -n 20 'http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz' && tar -xvf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz && mv clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-16.04 clang_llvm-8.0.0-x86_64-linux-gnu-ubuntu-16.04 && rm clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz && cd / \
RUN cd /OpenArkCompiler \
    && source ./build/envsetup.sh \
    && make -j8
WORKDIR /
