# MoodleHost

## What is this?
MoodleHost provides a simple CLI command to run an Apache web server with all the trimmings ready to run a Moodle environment for development or testing. It is based on the Docker image moodlehq/moodle-php-apache and adds xdebug with sessionkey PHPSTORM. It has a built in Redis server that can be used as an option.

<b>ATTENTION:</b> The resulting web server is by <i>no</i> means secure. Never use it for production environments!


## Preliminaries
You need to have Docker installed to use MoodleHost.

You need to run a separate database server according to your MoodleHost setup.

## Installation
To install MoodleHost on you need to run the install_moodlehost script as superuser (e.g. <code>$ sudo ./install_moodlehost</code>). 

This will place the moodlehost command into <code>/usr/local/bin/moodlehost</code> and the configuration file into <code>/etc/moodlehost.conf</code>.

During the installation you will be prompted to edit the moodlehost configuration file. The configiuration file allows to set default values for the installation like the port and PHP version used when using the moodlehost command without options. <b>Please note:</b> Values in moodlehost.conf still may be overridden by options when running the moodlehost command.

## the moodlehost command
The basic CLI command is

	$ moodlehost [<options>] start / stop / purge / status
	
The available options are:

	-d <db_host_ip>: set the IP address of the database server (default = 127.0.0.1, can be set in moodlehost.conf)
	-f <path_to_filedir>: map an existing filedir repository into /var/www/moodledata/filedir (can be set in moodlehost.conf)
	-h : a help page
	-l : local xdebug for macOS/PHPStorm
	-m <moodledata>: set path on host(!) to moodledata (default is $PWD/moodledata - can be set in moodlehost.conf)
	-m none: do NOT create a moodledata directory
	-n host: forcing docker to use the host network
	-p <port>: set the port number used by Apache (default=80 - can be set in moodlehost.conf)
	-r start a local Redis server
	-v <php_version>: select the PHP version (default=8.1, allowed values: 7.1, 7.2, 7.3, 7.4, 8.0, 8.1, 8.2, 8.3 - can be set in moodlehost.conf)
	-w <webroot>: set the path to the webroot directory (default: $PWD - can be set in moodlehost.conf)

## Usage
To use moodlehost simply change into the directory you want to host. There you may issue '<code>$ moodlehost start</code>' to start a server with default values (as of /etc/moodlehost.conf).

Now point your browser to "http://localhost" to see the resulting web page.

<b>Please note:</b> The resulting Docker container will be named '<code>moodlehost-\<port></code>' (e.g. 'moodlehost-80'). When using a different port value other than the default one you will need to use the same option to stop the server again or purge it's moodledata (see below).

Available commands are:

	moodlehost <options> start: start moodlehost server

	moodlehost <options> stop: stop given moodlehost server

	moodlehost <options> purge: remove all moodledata but the filedir for the given moodlehost server

	moodlehost status: return a status message for every moodlehost instance running

### config.php.sample
To allow to run a Moodle instance on any allowed port the setting for $CFG->wwwroot needs to be amended as shown in the<code>config.php.sample</code>file. You may copy and modify it according to your setup. In this case please note as the IP address of the database server is mapped to 'db_host' inside the Docker container you may always address the<code>$CFG->dbhost</code>with this, as shown in the sample.

<hr>
v.2.1 2025-03-06
