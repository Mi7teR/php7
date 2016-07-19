# php7
Docker php7 with critical extensions (redis, gd, apcu, intl, soap, pdo, mbstring, iconv and ... )

Use this image to run a container with latest stable of php7. it ships with:

 - last stable version of Redis extension (official version)
 - Intl extension (official version)
 - Apcu extension ([official build for php7](https://pecl.php.net/package/APCu))
 - Soap
 - PDO (MySQL, PostgreSQL, Sqlite)
 - GD
 - iconv
 - mbstring
 - git
 - composer
 - xdebug

----------
##usage

    docker pull mehrdadkhah/php7
 
**Access to php7 bash**
	docker exec -it php7 bash

**Run a complete webserver with all development tools (lemp)**


you should use [lemp-php7 docker compose](https://github.com/Mehrdad-Dadkhah/lemp-php7)	 that use this repo.