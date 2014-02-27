from phusion/baseimage
maintainer Fareed Dudhia <fareeddudhia@gmail.com>

run apt-get update -q
run apt-get install -qy build-essential git unzip
add https://dl.bintray.com/mitchellh/serf/0.4.1_linux_amd64.zip serf.zip
run unzip serf.zip
run mv serf /usr/bin

# Set root user's home dir
env HOME /root

# Set SERF_ROLE
env SERF_ROLE serfer

# Add Serf to initialization proc
run mkdir /etc/service/serf
run touch /etc/service/serf/run
run echo "exec serf agent -role \$SERF_ROLE && echo 'RAN'" > /etc/service/serf/run
run chmod +x /etc/service/serf/run

# Add the default env for the SERF_ROLE
run touch /etc/container_environment/SERF_ROLE
run echo -n "serfer" > /etc/container_environment/SERF_ROLE

# Set the usual CMD for phusion/baseimage
CMD ["/sbin/my_init"]

# Expose the proper pors
EXPOSE 7946 7373

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
