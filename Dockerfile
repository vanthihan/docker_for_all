FROM ubuntu:18.04

LABEL version="1.0" \
      maintainer="thi.hanvan@rapsodo.com" \
      description="This docker setup is used for setup build environment for STPlus"

# https://dev.to/0xbf/set-timezone-in-your-docker-image-d22 for how to setup timezone
# for timezone list, pls visit https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
ENV TZ=Asia/Singapore

#---------------------------------------------------------------#
# You may change below 4 args to meet your environment
ARG user=stplus-docker
ARG user_pass=1234
ARG user_id=1000
ARG group_id=1000
#---------------------------------------------------------------#

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get upgrade -y && \
    useradd --create-home --no-log-init --shell /bin/bash ${user} && \
        adduser ${user} sudo && \
        echo "${user}:${user_pass}" | chpasswd && \
    usermod -u ${user_id} -g ${group_id} ${user} && \
    apt-get clean all

WORKDIR /home/${user}

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install --show-progress -y device-tree-compiler git-core u-boot-tools mtools \
        parted libudev-dev libusb-1.0-0-dev autoconf autotools-dev libsigsegv2 \
        m4 intltool libdrm-dev curl sed make binutils build-essential gcc g++ \
        bash patch gzip gawk bzip2 perl tar cpio unzip rsync file bc findutils wget \
        libncurses5 libglib2.0-dev libgtk2.0-dev libglade2-dev cvs git \
        mercurial openssh-client subversion asciidoc w3m dblatex graphviz \
        libc6:i386 libssl-dev expect fakeroot cmake flex bison liblz4-tool \
        libtool keychain python3 python-matplotlib time vim libncurses-dev && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && \
    chmod a+x /usr/bin/repo && \
    apt-get clean all && \
    mkdir .ssh && \
    chown ${user}: .ssh && \
    chmod 700 .ssh && \
    #rm -f /usr/bin/python && \
    #ln -s /usr/bin/python3 /usr/bin/python && \
    echo "" >> ~/.bashrc && \
    echo "eval \$(ssh-agent)" >> .bashrc

USER ${user}
