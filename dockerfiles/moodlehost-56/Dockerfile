FROM moodlehq/moodle-php-apache:5.6
MAINTAINER Matthias Opitz <m.opitz@qmul.ac.uk>
# v.0.1 - 2019-11-06
# v.0.2 - 2020-09-09 - xdebug no longer supported?!
RUN apt-get update
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
#RUN pecl install xdebug
RUN echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so" >> /usr/local/etc/php/php.ini
RUN echo "[xdebug]" >> /usr/local/etc/php/php.ini

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_port=9000" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.remote_host=172.17.0.1" >> /usr/local/etc/php/php.ini

#RUN ls /etc/init.d/apache2
RUN service apache2 start &


