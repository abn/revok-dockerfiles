FROM revok/base:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

ADD assets/supervisord.conf /etc/supervisord.conf
ADD assets/revok.conf ${REVOK_CONF}/revok.conf
ADD assets/revok-caroline-start ${REVOK_HOME}/bin/revok-caroline-start

CMD ["/usr/bin/supervisord", "-n"]
