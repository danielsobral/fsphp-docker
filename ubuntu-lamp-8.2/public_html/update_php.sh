#!/usr/bin/env bash
php_default=$(php -v | cut -b5-7 | head -1)
a2dismod 'php'$php_default
sleep 3
a2enmod php8.2
sleep 3
update-alternatives --set php /usr/bin/php8.2
sleep 3
service apache2 restart