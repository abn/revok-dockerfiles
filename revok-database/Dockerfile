FROM alectolytic/postgres:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

USER root
RUN yum -y update && yum -y clean all

ADD assets/revok-pgsql.sh ${POST_INIT}/revok-pgsql.sh
ADD assets/revok.sql ${POST_INIT}/revok.sql

USER postgres
WORKDIR ${PGHOME}
