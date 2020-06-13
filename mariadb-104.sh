output(){
    echo -e '\e[36m'$1'\e[0m';
}

mariadb_root_reset(){
    rootpassword=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`  
    Q0="SET old_passwords=0;"
    Q1="SET PASSWORD FOR root@localhost = PASSWORD('$rootpassword');"
    Q2="FLUSH PRIVILEGES;"
    SQL="${Q0}${Q1}${Q2}"
    mysql mysql -e "$SQL"
    output "Your MariaDB root password is $rootpassword"
}

mariadb_root_reset
