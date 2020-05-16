FROM ubuntu:20.04
# パッケージ取得元をKDDI研究所に変更
RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://www.ftp.ne.jp/Linux/packages/ubuntu/archive/%g" /etc/apt/sources.list \
    && apt-get update --yes --quiet \
    && apt-get upgrade --yes --quiet \
    && apt-get install --yes --quiet build-essential clang gcc-10 libopenblas-openmp-dev libopenblas64-openmp-dev llvm mingw-w64 \
    && mkdir /opt/work/
