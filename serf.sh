#!bin/sh
echo "exec serf agent -role \$SERF_ROLE >> /var/log/serf.log 2>&1" > /etc/service/serf/run
