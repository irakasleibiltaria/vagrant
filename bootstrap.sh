#!/usr/bin/env bash

apt-get update
#apt-get install -y apache2

sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php5-oldstable
sudo apt-get update

apt-get -y install php5-mysql apache2 php5 php5-dev php-pear build-essential

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

#apt-get install debconf-utils -y
#debconf-set-selections <<< "mysql-server mysql-server/root_password password root" 
#debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
#apt-get install mysql-server -y

# xdebug
mkdir /var/log/xdebug
chown www-data:www-data /var/log/xdebug
sudo pecl install xdebug

#php.ini xdebug
echo '' >> /etc/php5/apache2/php.ini
echo ';;;;;;;;;;;;;;;;;;;;;;;;;;' >> /etc/php5/apache2/php.ini
echo '; Added to enable Xdebug ;' >> /etc/php5/apache2/php.ini
echo ';;;;;;;;;;;;;;;;;;;;;;;;;;' >> /etc/php5/apache2/php.ini
echo '' >> /etc/php5/apache2/php.ini
echo 'zend_extension="'$(find / -name 'xdebug.so' 2> /dev/null)'"' >> /etc/php5/apache2/php.ini
echo 'xdebug.default_enable = 1' >> /etc/php5/apache2/php.ini
echo 'xdebug.idekey = "vagrant"' >> /etc/php5/apache2/php.ini
echo 'xdebug.remote_enable = 1' >> /etc/php5/apache2/php.ini
echo 'xdebug.remote_autostart = 0' >> /etc/php5/apache2/php.ini
echo 'xdebug.remote_port = 9000' >> /etc/php5/apache2/php.ini
echo 'xdebug.remote_handler=dbgp' >> /etc/php5/apache2/php.ini
echo 'xdebug.remote_log="/var/log/xdebug/xdebug.log"' >> /etc/php5/apache2/php.ini
echo 'xdebug.remote_host=10.0.2.2 ; IDE-Environments IP, from vagrant box.' >> /etc/php5/apache2/php.ini

#restart apache
service apache2 restart