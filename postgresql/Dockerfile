FROM omixnavigator/base
MAINTAINER David Fazekas <fazekasda@gmail.com>

ENV PG_VERSION 9.4
ENV PG_admin_pass postgres

RUN apt-get install -y postgresql-9.4 \
  && adduser --system --no-create-home --disabled-login --disabled-password --group postgres

COPY postgresql.conf /etc/postgresql/9.4/main/postgresql.conf
COPY pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
COPY init.sh /sbin/init.sh
RUN chmod +x /sbin/init.sh

RUN mkdir -p /DATA/postgresql \
  && mkdir -p /LOG/postgresql \
  && mkdir -p /CONFIG/postgresql \
  && cp -a /etc/postgresql/9.4/main/* /CONFIG/postgresql \
  && chown -R postgres:postgres /DATA/postgresql \
  && chown -R postgres:postgres /LOG/postgresql \
  && chown -R postgres:postgres /CONFIG/postgresql \
  && chown -R postgres:postgres /var/run/postgresql \
  && /sbin/init.sh init_db

EXPOSE 5432
VOLUME  ["/CONFIG", "/LOG", "/DATA"]
ENTRYPOINT ["dumb-init", "/sbin/init.sh"]
CMD ["run_db"]
