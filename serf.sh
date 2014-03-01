#!/bin/sh
exec serf agent -role $SERF_ROLE \
    -event-handler="member-join=python member_join.py" \
    -event-handler="member-leave,member-failed=python member_leave.py" >> /var/log/serf.log 2>&1
