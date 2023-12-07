#!/bin/bash

output(){
    echo -e '\e[36m'"$1"'\e[0m';
}

mariadb_root_reset(){
    service mysql stop
    mysqld_safe --skip-grant-tables >res 2>&1 &
    sleep 5
    rootpassword=$(/dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    Q1="UPDATE user SET plugin='';"
    Q2="UPDATE user SET password=PASSWORD('$rootpassword') WHERE user='root';"
    Q3="FLUSH PRIVILEGES;"
    SQL="${Q1}${Q2}${Q3}"
    mysql mysql -e "$SQL"
    pkill mysqld
    service mysql restart
    output "Your MariaDB root password is $rootpassword"
}

mariadb_root_reset
