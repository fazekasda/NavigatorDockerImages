FROM omixnavigator/base
MAINTAINER David Fazekas <fazekasda@gmail.com>

ENV NGINX_VERSION release-1.9.12

RUN mkdir /var/log/nginx \
	&& mkdir /etc/nginx \
	&& cd ~ \
	&& git clone https://github.com/nginx/nginx.git \
	&& cd ~/nginx \
	&& git checkout tags/${NGINX_VERSION} \
	&& ./auto/configure \
		--with-http_ssl_module \
		--with-debug \
		--conf-path=/etc/nginx/nginx.conf \
		--sbin-path=/usr/sbin/nginx \
		--pid-path=/var/log/nginx/nginx.pid \
		--error-log-path=/var/log/nginx/error.log \
		--http-log-path=/var/log/nginx/access.log \
	&& make install \
	&& cd .. \
	&& rm -rf nginx \
	&& rm /etc/nginx/nginx.conf \
	&& adduser --system --no-create-home --disabled-login --disabled-password --group nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./0000-ddefault.conf /etc/nginx/sites-enabled/0000-ddefault.conf
COPY ./index.html /var/www/index.html
EXPOSE 80
VOLUME ["/etc/nginx/sites-enabled", "/var/log/nginx", "/var/www"]

WORKDIR /etc/nginx
CMD ["nginx"]
