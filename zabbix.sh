#!/bin/bash

# Adds Zabbix to Ubuntu repository and install it with MySQL

wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.0+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_latest_7.0+ubuntu24.04_all.deb

sudo apt update

sudo apt install -y mysql-server zabbix-proxy-mysql zabbix-sql-scripts

# Checks if MySQL was installed and if it's running
if systemctl is-active --quiet mysql; then
    echo "MySQL has been installed and is running"
else
    echo "MySQL has not been installed successfully."
fi

# Init Zabbix service, checks if it was installed and if it's running

sudo systemctl start zabbix-proxy

if ! systemctl is-active --quiet zabbix-proxy; then
    echo "Zabbix hasn't been installed successfully. Please, fix it!"
else
    echo "Zabbix has been installed successfully!"
fi

# Sets up Zabbix and MySQL

sudo mysql -uroot <<EOF
create database zabbix_proxy character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'test';
grant all privileges on zabbix_proxy.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
EOF

cat /usr/share/zabbix-sql-scripts/mysql/proxy.sql | mysql --default-character-set=utf8mb4 -uzabbix -ptest zabbix_proxy

sudo mysql -uroot -e "set global log_bin_trust_function_creators = 0;"

sudo echo "DBPassword=test" >> /etc/zabbix/zabbix_proxy.conf

sudo systemctl restart zabbix-proxy
sudo systemctl enable zabbix-proxy