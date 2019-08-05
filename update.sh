#!bin/sh
apt-get update && apt-get upgrade 2>&1 >> /var/log/update_script.log
