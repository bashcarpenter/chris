#!/bin/bash 
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

sudo yum install httpd -y;

sudo systemctl enable httpd;

sudo yum install wget -y;

sudo wget -O /var/www/html/index.html https://raw.githubusercontent.com/bashcarpenter/chris/main/index.html;

sudo systemctl start httpd;

sudo firewall-cmd --zone=public --add-service=https;

sudo firewall-cmd --zone=public --permanent --add-service=https;



