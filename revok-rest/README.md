# Dockerfile: Revok Scanner REST API

This is a container image for the Revok Scanner's rest-api server.

## Build
```
sudo docker build --tag revok/rest .
```

## Usage Example
```
REST_PORT=8443

# run in foreground
sudo docker run \
    -p ${REST_PORT}:${REST_PORT} \
    -v ${REVOK_CONF}:/opt/revok/conf \
    revok/rest
```
