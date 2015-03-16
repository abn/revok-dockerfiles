# Dockerfile: Revok Scanner Caroline node

This is a container image for the Revok Scanner's caroline node.

## Build
```
sudo docker build --tag revok/caroline-node .
```

## Usage Example
```
# run in foreground
sudo docker run \
    -v ${REVOK_CONF}:/opt/revok/conf \
    revok/caroline-node
```
