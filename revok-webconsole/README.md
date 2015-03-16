# Dockerfile: Revok Scanner webconsole

This is a container image for the Revok Scanner's webconsole.

## Build
```
sudo docker build --tag revok/webconsole .
```

## Usage Example
```
CONF_DIR=/path/to/conf/on/host
HTTPD_CONF=/path/to/custom/httpd/conf.d
HTTPD_LOG=/path/to/httpd/log
WEB_PORT=3030

# run in foreground
${DOCKER_CMD} run \
    -p ${WEB_PORT}:${WEB_PORT} \
    -v ${CONF_DIR}:/opt/revok/conf \
    -v ${HTTPD_CONF}:/etc/httpd/conf.d \
    -v ${HTTPD_LOG}:/var/log/httpd \
    revok/webconsole
```
