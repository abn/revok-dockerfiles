# Dockerfile: Revok Scanner database container

Based on [alectolytic/postgres](https://registry.hub.docker.com/u/alectolytic/postgres/) container, this implements a PostgreSQL based database for the Revok Scanner.

Refer to [base image documentation](https://github.com/abn/dockerfiles/tree/master/fedora-postgres#dockerfile-postgresql-on-fedora) for more information.

## Build
```
sudo docker build --tag revok/database .
```

## Usage Example
```
PGHOME=/path/to/host/pghome
PGPORT=5432

# set password for revok database user
echo "password" > ${PGHOME}/revok.pwfile

# run in foreground
sudo docker run \
    -p ${PGPORT}:${PGPORT} \
    -v ${PGHOME}:/var/lib/pgsql \
    --name revok-db \
    revok/database
```

## Volumes
| Path | Description |
| :--- | :---------- |
| /var/lib/pgsql | PostgreSQL home directory |

## Revok database user password

On initial boot a random password is generated and stored as `${PGHOME}/revok.pwfile`. If this file was previously present before boot, the password in the file is used for the revok database user.
