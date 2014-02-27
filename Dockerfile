from phusion/baseimage
maintainer Fareed Dudhia <fareeddudhia@gmail.com>

# Set root user's home dir
ENV HOME /root

# Install Serf
run apt-get update -q
run apt-get install -qy build-essential git unzip
add https://dl.bintray.com/mitchellh/serf/0.4.1_linux_amd64.zip serf.zip
run unzip serf.zip
run mv serf /usr/bin

# Add Serf to initialization proc
run mkdir /etc/service/serf
run touch /etc/service/serf/run
run echo "exec serf agent -role $SERF_ROLE" > /etc/service/serf/run

# Set the usual CMD for phusion/baseimage
CMD ["/sbin/my_init"]

# Expose the proper pors
EXPOSE 7946 7373

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
