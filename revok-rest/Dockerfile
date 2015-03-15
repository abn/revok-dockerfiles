FROM revok/base:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

ADD assets/supervisord.conf /etc/supervisord.conf
ADD assets/revok.conf ${REVOK_CONF}/revok.conf
ADD assets/revok-rest-start ${REVOK_HOME}/bin/revok-rest-start

CMD ["/usr/bin/supervisord", "-n"]
