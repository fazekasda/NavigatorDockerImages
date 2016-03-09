FROM omixnavigator/base
MAINTAINER David Fazekas <fazekasda@gmail.com>

ENV PG_VERSION 9.4

RUN apt-get install -y postgresql-9.4 \
  && adduser --system --no-create-home --disabled-login --disabled-password --group postgres

RUN mkdir -p /DATA/postgresql \
  && mkdir -p /LOG/postgresql \
  && mkdir -p /CONFIG/postgresql \
  && cp -a /etc/postgresql/9.4/main/* /CONFIG/postgresql \
  && chown -R postgres:postgres /DATA/postgresql \
  && chown -R postgres:postgres /LOG/postgresql \
  && chown -R postgres:postgres /CONFIG/postgresql \
  && chown -R postgres:postgres /var/run/postgresql

COPY postgresql.conf /CONFIG/postgresql/postgresql.conf
COPY pg_hba.conf /CONFIG/postgresql/pg_hba.conf
COPY init.sh /sbin/init.sh
RUN chmod +x /sbin/init.sh

USER postgres
RUN /usr/lib/postgresql/9.4/bin/initdb -D /DATA/postgresql

EXPOSE 5432
VOLUME  ["/CONFIG", "/LOG", "/DATA"]
ENTRYPOINT ["dumb-init", "/sbin/init.sh"]
