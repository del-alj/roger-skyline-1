#!/bin/bash

tst="/home/ziton/crontab.sha1"
if [ ! -e "$tst" ]
then
	sha1sum /etc/crontab > $tst
else
	comp="$(sha1sum -c crontab.sha1 | grep "OK")"
	if [ -z "$comp" ]
	then
		sudo rm -rf /home/ziton/crontab.sha1
		sha1sum /etc/crontab > $tst
		echo "From: root
		The content of the file /etc/crontab has been changed" | mail -s "notification from dino server" root
	#	rm -rf /home/ziton/dead.letter
	fi
fi
