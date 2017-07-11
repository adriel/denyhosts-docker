FROM alpine:3.6

MAINTAINER Adriel Kloppenburg
LABEL denyhosts_version="3.0" architecture="amd64"

RUN apk add --no-cache git python py-ipaddr \
 && git clone https://github.com/denyhosts/denyhosts.git \
 && apk del git \
 && cd denyhosts \
 && python setup.py install \
 && rm -r /denyhosts

COPY denyhosts.conf /etc/denyhosts.conf

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
