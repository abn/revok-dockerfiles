FROM fedora:latest
MAINTAINER "Arun Neelicattu" <arun.neelicattu@gmail.com>

# install any updates
RUN yum -y update

# install general dependencies
RUN yum -y install \
    deltarpm wget git supervisor tar bzip2 \
    ruby ImageMagick openssl sslscan expect

# install dependencies for bundles
RUN yum -y install \
    rubygems ruby-devel \
    rubygem-nokogiri rubygem-pg rubygem-mechanize rubygem-rack rubygem-stomp \
    rubygem-typhoeus rubygem-mail rubygem-sequel \
    make automake patch gcc gcc-c++
RUN gem install bundle

# install python-mitmproxy
RUN yum -y install \
    python python-pip python-devel \
    python-tornado python-urwid python-pyasn1 python-lxml \
    python-pillow pyOpenSSL python-cffi python-cryptography python-passlib
RUN pip install mitmproxy

ENV REVOK_VERSION=0.8.1
ENV REVOK_USER=revok
ENV REVOK_HOME=/opt/revok
ENV REVOK_CONF=${REVOK_HOME}/conf
ENV REVOK_VAR=${REVOK_HOME}/var

ENV PHANTOMJS_VERSION=1.9.8
ENV PHANTOMJS_URL=http://cnpmjs.org/mirrors/phantomjs/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2

# install phantomjs
RUN cd /tmp \
    && TARBALL=$(basename ${PHANTOMJS_URL}) \
    && wget -O ${TARBALL} ${PHANTOMJS_URL} \
    && tar xjvf ${TARBALL} \
    && find ./ -type f -name phantomjs -exec mv {} /usr/bin/. \; \
    && rm -rf phantomjs-${PHANTOMJS_VERSION}*

# cleanup
RUN yum -y clean all

# prepare revok system user
RUN useradd \
    --home-dir ${REVOK_HOME} --no-create-home \
    --system \
    --comment "REVOK User" \
    ${REVOK_USER}

RUN git clone https://github.com/Revok-scanner/revok.git ${REVOK_HOME}
RUN chown -R ${REVOK_USER}:${REVOK_USER} ${REVOK_HOME}

USER ${REVOK_USER}
WORKDIR ${REVOK_HOME}
RUN git checkout -b v${REVOK_VERSION} v${REVOK_VERSION}
RUN bundle install

RUN mkdir -p ${REVOK_CONF} ${REVOK_VAR}
RUN cd ${REVOK_VAR} \
    && mkdir log pid lock run

VOLUME ["${REVOK_CONF}", "${REVOK_VAR}/log", "${REVOK_VAR}/run"]

ONBUILD USER root
ONBUILD RUN yum -y update && yum -y clean all
ONBUILD USER ${REVOK_USER}
