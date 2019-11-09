#!/bin/bash

echo "!! SSL SITE DIRECTORY GENERATING SCRIPT STARTED !!"

read domain

if [ "${domain}" = "" ]; then
exit
fi


mkdir ./${domain}
mkdir ./${domain}/public
echo "${domain} domain added" > ./${domain}/public/index.html
mkdir ./${domain}/tmp
chmod 777 ./${domain}/tmp
echo "
<VirtualHost *:80>
    ServerName ${domain}
    ServerAdmin dev@agoyli.com
    DocumentRoot /var/www/${domain}/public
    <Directory /var/www/${domain}/public>
        AllowOverride All
        Options +Includes -Indexes +ExecCGI
        php_admin_value open_basedir /var/www/${domain}
        php_admin_value upload_tmp_dir /var/www/${domain}/tmp
        php_admin_value session.save_path /var/www/${domain}/tmp
    </Directory>
</VirtualHost>

<VirtualHost *:443>
    ServerName ${domain}
    ServerAdmin dev@agoyli.com
    DocumentRoot /var/www/${domain}/public
    <Directory /var/www/${domain}/public>
        AllowOverride All
        Options +Includes -Indexes +ExecCGI
        php_admin_value open_basedir /var/www/${domain}
	php_admin_value upload_tmp_dir /var/www/${domain}/tmp
	php_admin_value session.save_path /var/www/${domain}/tmp
    </Directory>
    #SSLEngine on
    #SSLCertificateFile /etc/letsencrypt/live/${domain}/cert.pem
    #SSLCertificateKeyFile /etc/letsencrypt/live/${domain}/privkey.pem
    #SSLCertificateChainFile /etc/letsencrypt/live/${domain}/chain.pem
</VirtualHost>
" > /etc/apache2/sites-enabled/${domain}.conf
