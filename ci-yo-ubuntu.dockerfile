ARG tag=20.04
FROM ubuntu:${tag}

RUN \
touch /etc/apt/mirrorlist.txt && \
echo "http://azure.archive.ubuntu.com/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://ubuntu-ashisuto.ubuntulinux.jp/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://www.ftp.ne.jp/Linux/packages/ubuntu/archive/" >> /etc/apt/mirrorlist.txt && \
echo "http://ftp.riken.jp/Linux/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://ftp.jaist.ac.jp/pub/Linux/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://ubuntutym.u-toyama.ac.jp/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://ftp.tsukuba.wide.ad.jp/Linux/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://mirror.fairway.ne.jp/ubuntu/" >> /etc/apt/mirrorlist.txt && \
echo "http://jp.archive.ubuntu.com/ubuntu/" >> /etc/apt/mirrorlist.txt && \
sed -i.bak -r 's!(deb|deb-src) http://archive\.ubuntu\.com/ubuntu!\1 mirror+file:/etc/apt/mirrorlist.txt!' /etc/apt/sources.list

RUN apt-get update --yes \
&& apt-get upgrade --yes \
&& apt-get install --yes --no-install-recommends build-essential clang llvm libomp-dev lld libopenblas-dev \
&& mkdir /opt/work/

WORKDIR /opt/work
