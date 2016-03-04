FROM debian:jessie
MAINTAINER David Fazekas <fazekasda@gmail.com>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update \
	&& apt-get install -y \
		ca-certificates \
		git \
		gcc \
		make \
		libpcre3-dev \
		zlib1g-dev \
		libssl-dev \
		wget

CMD ["/bin/bash"]
