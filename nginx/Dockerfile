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

EXPOSE 80 443
VOLUME ["/etc/nginx/sites-enabled", "/var/log/nginx", "/var/www"]

WORKDIR /etc/nginx
ENTRYPOINT ["nginx"]
CMD [""]
