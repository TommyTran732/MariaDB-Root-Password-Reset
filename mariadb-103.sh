#!/bin/sh

# Copyright (C) 2023 Thien Tran
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

set -eu

output(){
    printf '\e[1;34m%-6s\e[m\n' "${@}"
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
