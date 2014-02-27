from phusion/baseimage
maintainer Fareed Dudhia <fareeddudhia@gmail.com>

# Set root user's home dir
ENV HOME /root



# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
