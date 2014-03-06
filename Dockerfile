from phusion/baseimage
maintainer Fareed Dudhia <fareeddudhia@gmail.com>

add https://dl.bintray.com/mitchellh/serf/0.4.1_linux_amd64.zip serf.zip

# Set root user's home dir
env HOME /root

run mkdir /members
add ./members/ /members/
add ./serf.sh /etc/service/serf/run
add ./member_join.py /
add ./member_leave.py /

add ./install.sh /
run exec /install.sh

# Set the usual CMD for phusion/baseimage
CMD ["/sbin/my_init"]

# Expose the proper pors
EXPOSE 7946 7373

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
