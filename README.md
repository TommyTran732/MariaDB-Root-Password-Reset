# MariaDB-Root-Password-Reset

[![ShellCheck](https://github.com/TommyTran732/MariaDB-Root-Password-Reset/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/TommyTran732/MariaDB-Root-Password-Reset/actions/workflows/shellcheck.yml)

Simple scripts to reset your MariaDB root password. Please note that for MariaDB 10.4.3+, it will change the authentication for root from unix_socket_authentication to mysql_native_authentication (How it was with MariaDB 10.4.2 and below).

- MariaDB 10.4.3 - 10.6.x: Use the `mariadb-104.sh` script
- MariaDB 10.4 - 10.4.2: Use the `mariadb-104-legacy.sh` script
- MariaDB 10.1-10.3 or MySQL 5.7.x: Use the `mariadb-103.sh` script.
