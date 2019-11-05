# MoodleHost

## Preliminaries
You need to have Docker installed to use MoodleHost.

## Installation
To install MoodleHost on you need to run the install_moodlehost script. Duriung the installation you will be promted to edit the moodlehost configuration file (moodlehost.conf). The configiuration file allwos to set default values for the installation like the port and PHP version used. Values in moodlehost.conf may be overridden by options when running the moodlehost command

## moodlehost.conf
The configuration file will be installed into /etc/moodlehost.conf and contains the default values when running moodlehost without options.

## the moodlehost command
There are several options available when running moodlehost from a command line:

	-d <database-server-ip-address>: This will determine the IP address of the mysql database server. Inside moodlehost this address is then mapped to 'db_host'.

	-m <path-to-moodledata>: By default moodlehost will create/use a folder 'moodledata' within the hosted directory. With this option a different location may be used.

	-p <port>: The port the Apache web server will be using.

	-v <php-version>: Set the PHP version that will be used. Valid values are: 5.6, 7.0, 7.1, 7.2, 7.3

## Usage
To use moodlehost you need to change into the directory you want to host. There you may issue 'moodlehost start' to start a server with default values (as of /etc/moodlehost.conf).

Please note: the resulting Docker container will be named 'moodlehost-<php-version>'. When using a different PHP value other than the default one you will need to use the same option to stop the server again or purge it's moodledate (see below).

Available commands are:
	moodlehost <options> start: start moddlehost server

	moodlehost <options> stop: stop given moodlehost server

	moodlehost <options> purge: remnove all moodledata for the given moodlehost server

	<hr>
	v.1.1 2019-11-04
