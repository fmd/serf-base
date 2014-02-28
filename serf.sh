#!/bin/sh
exec serf agent -role $SERF_ROLE \
    -event-handler="member-join=/member_join.sh" \
    -event-handler="member-leave,member-failed=/member_leave.sh" >> /var/log/serf.log 2>&1
