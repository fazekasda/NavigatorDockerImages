#!/bin/bash

function run_nginx {
  nginx
  exit 0
}
function init_conf {
  mkdir -p /CONFIG/nginx
  cp -a /root/default/config/* /CONFIG/nginx
  chown -R nginx:nginx /CONFIG/nginx
}
function init_data {
  mkdir -p /DATA/nginx
  cp -a /root/default/data/* /DATA/nginx
  chown -R nginx:nginx /DATA/nginx
}
function init_log {
  mkdir -p /LOG/nginx
  chown -R nginx:nginx /LOG/nginx
}

for var in "$@"
do
  case $var in
    run_nginx)
      run_nginx
    ;;
    init_conf)
      init_conf
    ;;
    init_data)
      init_data
    ;;
    init_log)
      init_log
    ;;
    *)
      echo "Incorrect argoment: $var"
      exit 1
    ;;
  esac
done
