FROM omixnavigator/base
MAINTAINER David Fazekas <fazekasda@gmail.com>

ENV PG_VERSION 9.4

RUN apt-get install -y postgresql-9.4 \
  && adduser --system --no-create-home --disabled-login --disabled-password --group postgresql

COPY postgresql.conf /etc/postgresql/9.4/main/postgresql.conf
COPY pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
COPY init.sh /sbin/init.sh
RUN chmod +x /sbin/init.sh

RUN mkdir -p /DATA/postgresql \
  && mkdir -p /LOG/postgresql \
  && chown -R postgresql:postgresql /etc/postgresql/9.4/main \
  && chown -R postgresql:postgresql /var/run/postgresql \
  && chown -R postgresql:postgresql /DATA/postgresql \
  && chown -R postgresql:postgresql /LOG/postgresql

USER postgresql
RUN /usr/lib/postgresql/9.4/bin/initdb -D /DATA/postgresql

EXPOSE 5432
VOLUME  ["/etc/postgresql/9.4/main", "/LOG", "/DATA"]
ENTRYPOINT ["dumb-init", "/sbin/init.sh"]
