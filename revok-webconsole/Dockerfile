FROM revok/base:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

ENV WEB_PORT=3030

ADD assets/supervisord.conf /etc/supervisord.conf
ADD assets/revok.conf ${REVOK_CONF}/revok.conf
ADD assets/revok-wc-start ${REVOK_HOME}/bin/revok-wc-start

# we run as root since supervisord need to run httpd
USER root

# install passenger
RUN yum -y install httpd mod_passenger rubygem-passenger

# patch for hard-coded rest uri
RUN sed -i s/'127.0.0.1'/'revok-rest'/ ${REVOK_HOME}/webconsole/config.ru

# prepare webconsole
RUN cp -R ${REVOK_HOME}/webconsole /var/www/html/revok
RUN ln -s /var/www/html/revok/public /var/www/html/scanner

# httpd config
ADD assets/revok-httpd.conf /etc/httpd/conf.d/revok.conf

EXPOSE ${WEB_PORT}
VOLUME ["/etc/httpd/conf.d", "/var/log/httpd/"]

CMD ["/usr/bin/supervisord", "-n"]
