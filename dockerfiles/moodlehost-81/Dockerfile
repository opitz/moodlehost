FROM moodlehq/moodle-php-apache:8.1
MAINTAINER Matthias Opitz <m.opitz@qmul.ac.uk>
# v.1.0.0 - 2022-06-14
# v.1.1.0 - 2022-07-01 - adding Moodle cron job

RUN apt-get update
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
# install xdebug
RUN pecl install xdebug
#RUN apt-get install -y php-xdebug
RUN echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20210902/xdebug.so" >> /usr/local/etc/php/php.ini
RUN echo "[xdebug]" >> /usr/local/etc/php/php.ini

RUN echo "xdebug.mode=debug" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.discover_client_host = 1" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.client_host = 127.0.0.1" >> /usr/local/etc/php/php.ini && \
	echo "xdebug.client_port = 9003" >> /usr/local/etc/php/php.ini

# install php-excimer
RUN pecl install excimer
RUN echo "extension=excimer.so" >> /usr/local/etc/php/php.ini

# install php-yaml
RUN apt-get install -y libyaml-dev
RUN pecl install yaml
RUN echo "extension=yaml.so" >> /usr/local/etc/php/php.ini

# activate error log
RUN echo "error_log = /var/www/html/error.log" >> /usr/local/etc/php/php.ini

# enable Moodle cron jobs
# install cron
RUN apt-get install -y cron
# echo new cron into cron file
RUN echo "* * * * * /usr/local/bin/php  /var/www/html/admin/cli/cron.php >/dev/null" >> moodlecron
#install new cron file
RUN crontab -u www-data moodlecron
RUN rm moodlecron
# run cron - or so I hoped as for now this will NOT start the cron daemon in the Docker container.
# it therefore will be started by the 'moodlehost' script
#RUN cron &

# start Apache
#RUN ls /etc/init.d/apache2
RUN service apache2 start &


