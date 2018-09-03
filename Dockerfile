FROM 1and1internet/ubuntu-16-apache-php-7.2

RUN \
    apt-get update \
    && apt-get --assume-yes install apt-transport-https \

    && sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/mssql-ubuntu-xenial-release/ xenial main" > /etc/apt/sources.list.d/mssqlpreview.list' \
    && apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893 \
    && apt-get update \

    && ACCEPT_EULA=Y apt-get --assume-yes install msodbcsql unixodbc-dev-utf16 php-pear php-dev \

    && pecl install sqlsrv \
    && pecl install pdo_sqlsrv \

    && sed -i '$ a \\nextension=sqlsrv.so\nextension=pdo_sqlsrv.so' /etc/php/7.2/apache2/php.ini \

    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && COMPOSER_ALLOW_SUPERUSER=true composer --version \

    && mkdir /var/www/logs \
    && chmod -R 777 /var/www/logs

# Copy your files here
# COPY ./files /var/www/html
COPY ./composer.json /var/www/html/

RUN cd /var/www/html/ \
    && COMPOSER_ALLOW_SUPERUSER=true composer install
