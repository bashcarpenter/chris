#!/bin/bash 
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

yum install httpd -y;

systemctl enable httpd;

wget -O /var/www/html/index.html https://raw.githubusercontent.com/bashcarpenter/chris/main/index.html;

systemctl start httpd;


