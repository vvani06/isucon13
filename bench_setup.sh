#!/bin/bash
sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d-%H%M%S`
sudo rm -f /var/log/mysql/mysql-slow.log
sudo nginx -s reopen
sudo mysqladmin flush-logs

sudo cp ~/webapp/mysql/my.cnf /etc/mysql/my.cnf
sudo cp ~/webapp/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp ~/webapp/pdns/pdns.conf /etc/powerdns/pdns.conf
sudo cp ~/webapp/sysctl/sysctl.conf /etc/sysctl.conf

sudo systemctl daemon-reload
sudo systemctl restart mysql
sudo systemctl restart isupipe-ruby.service
sudo systemctl restart nginx
sudo systemctl restart pdns
sudo sysctl -p
