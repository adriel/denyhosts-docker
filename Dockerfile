FROM alpine

MAINTAINER Adriel Kloppenburg
LABEL denyhosts_version="3.0" architecture="amd64"

RUN apk add --no-cache git python py-ipaddr \
 && git clone --single-branch --branch "Python2.6" https://github.com/denyhosts/denyhosts.git \
 && apk del git

WORKDIR /denyhosts
RUN python setup.py install \
 && rm -r /denyhosts

COPY denyhosts.conf /etc/denyhosts.conf

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
