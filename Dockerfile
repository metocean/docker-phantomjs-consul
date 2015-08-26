FROM ubuntu:12.04
MAINTAINER Thomas Coats <t.coats@metocean.co.nz>

ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
ADD https://s3.amazonaws.com/travis-phantomjs/phantomjs-2.0.0-ubuntu-12.04.tar.bz2 /tmp/phantomjs.tar.bz2
ADD . /install/
RUN /install/install.sh
ENV GOMAXPROCS=2
CMD ["/sbin/initsh"]