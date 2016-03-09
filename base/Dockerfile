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
    sudo \
    wget \
    screen \
    python \
    python-setuptools \
    curl

# install dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init"]
CMD ["/bin/bash"]
