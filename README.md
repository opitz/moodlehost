# MoodleHost

## What is this?
MoodleHost provides a simple CLI command to run an Apache web server with all the trimmings ready to run a Moodle environment for development or testing. It is based on the Docker image moodlehq/moodle-php-apache and adds xdebug with sessionkey PHPSTORM. 

<b>ATTENTION:</b> The resulting web server is by <i>no</i> means secure. Never use it for production environments!


## Preliminaries
You need to have Docker installed to use MoodleHost.

## Installation
To install MoodleHost on you need to run the install_moodlehost script as superuser (e.g. <code>$ sudo ./install_moodlehost</code>). 

This will place the moodlehost into <code>/usr/local/bin/moodlehost</code> and the configuration file into <code>/etc/moodlehost.conf</code>.

During the installation you will be prompted to edit the moodlehost configuration file. The configiuration file allows to set default values for the installation like the port and PHP version used when using the moodlehost command without options. <b>Please note:</b> Values in moodlehost.conf still may be overridden by options when running the moodlehost command.

## the moodlehost command
The basic CLI command is

	$ moodlehost [<options>] start / stop / purge
	
The available options are:

	-d <database-server-ip-address>: This will determine the IP address of the mysql database server. Inside moodlehost this address is then mapped to 'db_host'.

	-f <path/to/filedir>: Mapping an existing filedir repository on the host into /var/www/moodledata/filedir.

	-m <path/to/moodledata>: By default moodlehost will create/use a folder 'moodledata' within the hosted directory. With this option a different location may be used.

	-p <port>: The port the Apache web server will be using. (default = 80)

	-v <php-version>: Set the PHP version that will be used. Valid values are: 5.6, 7.0, 7.1, 7.2, 7.3 (default = 7.3)

	-w <path/to/webroot>: Set path to the webroot directory (default = $PWD)

## Usage
To use moodlehost simply change into the directory you want to host. There you may issue '<code>$ moodlehost start</code>' to start a server with default values (as of /etc/moodlehost.conf).

Now point your browser to "http://localhost" to see the resulting web page.

<b>Please note:</b> The resulting Docker container will be named '<code>moodlehost-\<port></code>' (e.g. 'moodlehost-80'). When using a different port value other than the default one you will need to use the same option to stop the server again or purge it's moodledata (see below).

Available commands are:

	moodlehost <options> start: start moodlehost server

	moodlehost <options> stop: stop given moodlehost server

	moodlehost <options> purge: remove all moodledata but the filedir for the given moodlehost server

### config.php.sample
To allow to run a moodle instance on any allowed port the settig for $CFG->wwwroot needs to be amended as shown in this example. You may copy and modify it according to your setup. In this case please note as the IP address of the database server is mapped to 'db_host' inside the Docker container you may always address the $CFG->dbhost with this, as shown in the sample.

<hr>
v.1.2 2019-11-07
