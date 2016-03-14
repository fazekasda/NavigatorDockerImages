FROM omixnavigator/base
MAINTAINER David Fazekas <fazekasda@gmail.com>

ENV NGINX_VERSION release-1.9.12

RUN mkdir -p /CONFIG/nginx \
	&& mkdir -p /LOG/nginx \
	&& mkdir -p /DATA/nginx \
	&& mkdir -p /DATA/nginx/0000-default \
	&& cd ~ \
	&& git clone https://github.com/nginx/nginx.git \
	&& cd ~/nginx \
	&& git checkout tags/release-1.9.12 \
	&& ./auto/configure \
		--with-http_ssl_module \
		--with-debug \
		--conf-path=/CONFIG/nginx/nginx.conf \
		--sbin-path=/usr/sbin/nginx \
		--pid-path=/LOG/nginx/nginx.pid \
		--error-log-path=/LOG/nginx/error.log \
		--http-log-path=/LOG/nginx/access.log \
	&& make install \
	&& cd .. \
	&& rm -rf nginx \
	&& rm /CONFIG/nginx/nginx.conf \
	&& adduser --system --no-create-home --disabled-login --disabled-password --group nginx

COPY nginx.conf /CONFIG/nginx/nginx.conf
COPY 0000-default.conf /CONFIG/nginx/sites-enabled/0000-default.conf
COPY index.html /DATA/nginx/0000-default/index.html
COPY init.sh /sbin/init.sh
RUN chmod +x /sbin/init.sh

RUN mkdir -p /root/default/config \
	&& mkdir -p /root/default/data \
	&& cp -a /CONFIG/nginx/* /root/default/config \
	&& cp -a /DATA/nginx/* /root/default/data \
	&& chown -R nginx:nginx /CONFIG/nginx \
	&& chown -R nginx:nginx /LOG/nginx \
	&& chown -R nginx:nginx /DATA/nginx

EXPOSE 80
VOLUME  ["/CONFIG", "/LOG", "/DATA"]
ENTRYPOINT ["dumb-init", "/sbin/init.sh"]
CMD ["run_nginx"]
