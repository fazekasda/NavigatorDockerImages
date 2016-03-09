#!/bin/bash

function run_db {
  sudo -u postgres /usr/lib/postgresql/9.4/bin/postgres -D /DATA/postgresql -c config_file=/CONFIG/postgresql/postgresql.conf
  exit 0
}
function init_conf {
  mkdir -p /CONFIG/postgresql
  cp -a /etc/postgresql/9.4/main/* /CONFIG/postgresql
  chown -R postgres:postgres /CONFIG/postgresql
}
function init_db {
  mkdir -p /DATA/postgresql
  chown -R postgres:postgres /DATA/postgresql
  sudo -u postgres /usr/lib/postgresql/9.4/bin/initdb -D /DATA/postgresql
}
function init_log {
  mkdir -p /LOG/postgresql
  chown -R postgres:postgres /LOG/postgresql
}
function set_admin_pass {
  sudo -u postgres /usr/lib/postgresql/9.4/bin/postgres -D /DATA/postgresql -c config_file=/CONFIG/postgresql/postgresql.conf &
  sleep 5
  sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '$PG_admin_pass';"
  pg_ctlcluster 9.4 main stop
}

for var in "$@"
do
  case $var in
    run_db)
      run_db
    ;;
    init_conf)
      init_conf
    ;;
    init_db)
      init_db
    ;;
    init_log)
      init_log
    ;;
    set_admin_pass)
      set_admin_pass
    ;;
    *)
      echo "Incorrect argoment: $var"
      exit 1
    ;;
  esac
done
