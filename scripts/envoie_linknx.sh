#!/bin/bash

if [ $# -ne 4 ]; then
	echo "Usage:"
	echo "  $0 <host> <port> <id_object_linknx> <value_object> "
	echo ""
exit
fi


HOST=$1
PORT=$2
id_linknx=$3
value_linknx=$4







	# Connect  to the TCP socket    
	exec 3<> "/dev/tcp/$HOST/$PORT"

	# Send request to fd 3
	echo -n -e '<write><object id="'$id_linknx'" value="'$value_linknx'" /></write>\04' 1>&3
	if [ "$PORT" = "80" ]; then
	        echo -n -e "Host: $HOST\r\n" 1>&3
	else
	        echo -n -e "Host: $HOST:$PORT\r\n" 1>&3
	fi
	echo -n -e "Connection: close\r\n" 1>&3
	echo -n -e "\r\n" 1>&3

	# Read HTTP status line from fd 3
	read STATUS 0<&3
	STATUS=$(echo "$STATUS" | tr -d '\r\n')
	echo "Status [[[$STATUS]]]" 1>&2

	if [[ $STATUS != "<write status='success'/>" ]] ;
		then
		echo 'erreur de conction'

	else
		echo 'ok'
	fi
	




exit

