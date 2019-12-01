#!/usr/bin/env bash

function check_container() {
	c_name=$1
#	do this for 'moodlehost' containers only
	if [[ $c_name == *"moodlehost"* ]]; then
	echo '---------------------------------------'
	echo 'Docker container '$c_name

#		get the HTTP port for this container
		port=$(docker inspect --format='{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' $c_name)
	 	echo 'HTTP listening on port: '$port

#		get arrays of mapped volume sources and destinations
		vs_array=($(echo $(docker inspect $c_name | grep "Source") | tr " " "\n"))
		vd_array=($(echo $(docker inspect $c_name | grep "Destination") | tr " " "\n"))

		echo 'Mapped volumes (host ==> container):'
		i=0
		for v_source in ${vs_array[@]}
		do
	 		if [[ $v_source != *"Source"* ]]; then
		 		echo "    "$v_source' ==> '${vd_array[$i]}
		 	fi
		 	((i++))
		done

#		show php version
		echo ' '
		docker exec $c_name php -v

#		show xdebug status
		docker exec $c_name php -i | grep 'xdebug support'		
		docker exec $c_name php -i | grep 'xdebug.idekey'		
	fi
}

#declare -a theList
# get a list of running docker containers
echo ' '
echo 'moodlehost status - v.1.3'
theList=$(docker ps -q)

containerNames=$(docker ps --format "{{.Names}}")

c_array=($(echo $(docker ps --format "{{.Names}}") | tr " " "\n"))


for c_name in ${c_array[@]}
do
	check_container $c_name
done
echo '---------------------------------------'
echo ' '

