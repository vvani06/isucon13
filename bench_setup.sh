#!/bin/bash
sudo mv /var/log/nginx/access.log /var/log/nginx/access.log.`date +%Y%m%d-%H%M%S`
sudo rm -f /var/log/mysql/mysql-slow.log
sudo nginx -s reopen
sudo mysqladmin flush-logs

sudo systemctl daemon-reload
sudo systemctl restart mysql
sudo systemctl restart isupipe-ruby.service
sudo systemctl restart nginx
