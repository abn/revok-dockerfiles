# Dockerfile: Revok Scanner base container

This is a base container for the revok scanner containers.

## Environment variables
```
ENV REVOK_VERSION=0.8.1
ENV REVOK_USER=revok
ENV REVOK_HOME=/opt/revok
ENV REVOK_CONF=${REVOK_HOME}/conf
ENV REVOK_VAR=${REVOK_HOME}/var
ENV PHANTOMJS_VERSION=1.9.8
```

## Volumes

| Path | Description |
| :--- | :---------- |
| /opt/revok/conf | Revok global configuration files |
| /opt/revok/var/log | Revok log directory |
| /opt/revok/var/run | Revok run directory |
