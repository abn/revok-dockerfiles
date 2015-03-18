FROM revok/base:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

USER root
RUN yum -y install libnotify
USER ${REVOK_USER}

ENV REST_PORT=8443

ADD assets/supervisord.conf /etc/supervisord.conf
ADD assets/revok.conf ${REVOK_CONF}/revok.conf
ADD assets/revok-rest-start ${REVOK_HOME}/bin/revok-rest-start

EXPOSE ${REST_PORT}

CMD ["/usr/bin/supervisord", "-n"]
