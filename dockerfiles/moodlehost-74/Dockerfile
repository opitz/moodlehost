FROM moodlehq/moodle-php-apache:7.4
MAINTAINER Matthias Opitz <m.opitz@qmul.ac.uk>
# v.1.0.2 - 2019-12-16
# v.1.1.0 - 2022-06-14 - added php-excimer and php-yaml, activated error log

RUN apt-get update
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
# install xdebug
RUN pecl install xdebug-2.8.1
RUN echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/xdebug.so" >> /usr/local/etc/php/php.ini
RUN echo "[xdebug]" >> /usr/local/etc/php/php.ini

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_port=9000" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_host=172.17.0.1" >> /usr/local/etc/php/php.ini

# install php-excimer
RUN pecl install excimer
RUN echo "extension=excimer.so" >> /usr/local/etc/php/php.ini

# install php-yaml
RUN apt-get install -y libyaml-dev
RUN pecl install yaml
RUN echo "extension=yaml.so" >> /usr/local/etc/php/php.ini

# activate error log
RUN echo "error_log = /var/www/html/error.log" >> /usr/local/etc/php/php.ini

# start Apache
#RUN ls /etc/init.d/apache2
RUN service apache2 start &


