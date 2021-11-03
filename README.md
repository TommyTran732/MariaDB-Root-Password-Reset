# MariaDB-Root-Password-Reset
Simple scripts to reset your MariaDB root password. Please note that for MariaDB 10.4.3+, it will change the authentication for root from unix_socket_authentication to mysql_native_authentication (How it was with MariaDB 10.4.2 and below) <br /> <br />
MariaDB 10.4.3 - 10.6.x: `curl -sSL https://raw.githubusercontent.com/tommytran732/MariaDB-Root-Password-Reset/master/mariadb-104.sh | sudo bash` <br /> <br />
MariaDB 10.4 - 10.4.2: `curl -sSL https://raw.githubusercontent.com/tommytran732/MariaDB-Root-Password-Reset/master/mariadb-104-legacy.sh | sudo bash` <br /> <br />
MariaDB 10.1-10.3 or MySQL 5.7.x: `curl -sSL https://raw.githubusercontent.com/tommytran732/MariaDB-Root-Password-Reset/master/mariadb-103.sh | sudo bash`
