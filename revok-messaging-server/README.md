# Dockerfile: Revok Scanner messaging queue server

Based on [alectolytic/activemq](https://registry.hub.docker.com/u/alectolytic/activemq/) container, this implements a ActiveMQ based message queue server for the Revok Scanner.

Refer to [base image documentation](https://github.com/abn/dockerfiles/tree/master/fedora-activemq#dockerfile-apache-activemq-on-fedora) for more information.

## Build
```
sudo docker build --tag revok/messaging-server .
```

## Usage Example
```
AMQ_CONF_OVERLAY=/path/to/amq/conf
AMQ_DATA=/path/to/amq/data
MSG_QUEUE_PORT=61613

# run in foreground
sudo docker run \
    -p ${MSG_QUEUE_PORT}:${MSG_QUEUE_PORT} \
    -v ${AMQ_CONF_OVERLAY}:/var/run/activemq/conf \
    -v ${AMQ_DATA}:/opt/apache-activemq/data \
    --name revok-mq \
    revok/messaging-server
```

## Volumes
Refer to [base image volume documentation](https://github.com/abn/dockerfiles/tree/master/fedora-activemq#volumes).

## Caroline user password

Caroline nodes rely on the following snippet in `activemq.xml` configuration file to connect and perform required actions. The password attribute value should be updated here and matched in `revok.conf`.

```
<plugins>
    <simpleAuthenticationPlugin>
        <users>
            <authenticationUser username="caroline" password="password" groups="users"/>
        </users>
    </simpleAuthenticationPlugin>
</plugins>
```

An updated version of `activemq.xml` can be placed in ${AMQ_CONF_OVERLAY} directory mounted in the container. This is them used instead of the default.
