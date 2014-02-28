#!/bin/sh
exec serf agent -role $SERF_ROLE >> /var/log/serf.log 2>&1
