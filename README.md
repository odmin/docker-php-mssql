## About

Simple basic docker container for application with php 7.2 and MS SQL driver

Base image: 1and1internet/ubuntu-16-apache-php-7.2

### Inside

1. MS SQL ODBC driver: https://docs.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server

2. MS SQL php extensions: https://docs.microsoft.com/ru-ru/sql/connect/php/installation-tutorial-linux-mac
```
extension=sqlsrv.so
extension=pdo_sqlsrv.so
```

### ToDo

1. Install docker https://docs.docker.com/v17.09/engine/installation/

2. Clone:

```
git clone https://github.com/odmin/docker-php-mssql.git ./docker-php-mssql
```

3. Build image:

```
cd ./docker-php-mssql
docker build -t odmin/docker-php-mssql .
```

4. Run container:

```
docker run --name test-app -p 8080:8080 -it odmin/docker-php-mssql
```

5. Test: http://localhost:8080

### Usage as base image

```
FROM odmin/docker-php-mssql
```
