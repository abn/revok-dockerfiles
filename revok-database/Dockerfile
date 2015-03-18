FROM alectolytic/postgres:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

USER root
RUN yum -y update && yum -y clean all

ADD assets/revok-pgsql.sh ${POST_INIT}/revok-pgsql.sh

USER postgres
WORKDIR ${PGHOME}
