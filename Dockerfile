FROM ubuntu:16.04

# home配下にコピー
COPY .bashrc /root/
COPY .netrc /root/
COPY .zshrc /root/

RUN apt-get -y update \
	&& apt-get -y install build-essential \
	&& apt-get -y install zsh ant libjpeg-dev git vim language-pack-ja-base language-pack-ja ibus-mozc wget valgrind maven \
	&& apt -y install openjdk-8-jdk \
	&& apt-get  -y clean \
	&& ln -s /usr/lib/jvm/java-8-openjdk-amd64 /usr/lib/jvm/java \
	# gcc101
	&& cd /root/tmp \
	&& wget https://gcc-10-1-0.s3-ap-northeast-1.amazonaws.com/gcc_10_1_0_ubuntu16.tar.gz \
	&& tar zxvf gcc_10_1_0_ubuntu16.tar.gz -C /usr/local \
	&& ln -s /usr/local/gcc-10.1.0/bin/g++ /usr/local/bin/g++101 \
	&& ln -s /usr/local/gcc-10.1.0/bin/gcc /usr/local/bin/gcc101 \
	# go言語環境取得
 	&& mkdir /root/tmp \
	&& cd /root/tmp \
 	&& wget https://redirector.gvt1.com/edgedl/go/go1.15.6.linux-amd64.tar.gz \
 	&& tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz \
 	&& cd /root \
 	&& mkdir gohome \
 	&& bash \
 	&& . /root/.bashrc \
 	&& /usr/local/go/bin/go get github.com/comail/colog \
 	&& /usr/local/go/bin/go get golang.org/x/text/encoding/japanese \
 	&& /usr/local/go/bin/go get golang.org/x/text/transform \
 	&& rm -rf /root/tmp
