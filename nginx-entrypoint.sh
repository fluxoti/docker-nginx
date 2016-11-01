#!/bin/sh

# Tweak nginx to match the workers to cpu's
procs=$(cat /proc/cpuinfo | grep processor | wc -l)
sed -i "s/worker_processes .*/worker_processes $procs;/g" /etc/nginx/nginx.conf

# Setting the php-fpm server address and port
sed -i "s/PHP_FPM_HOST/$PHP_FPM_HOST/g" /etc/nginx/conf.d/default.conf
sed -i "s/PHP_FPM_PORT/$PHP_FPM_PORT/g" /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"