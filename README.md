# Docker containers for the Revok Scanner
This repository contains dockerfiles for [Revok Scanner](http://revok-scanner.github.io/revok/).

## Configuration
In order to run these containers and preserve state, we need to setup a runtime directory. For convenience, a template is provided. The following structure is required.

```
runtime/
├── activemq
│   ├── conf
│   │   └── activemq.xml
│   └── data
├── conf
│   ├── revok.conf
│   └── smtp_list.txt
├── httpd
│   ├── conf.d
│   │   └── revok.conf
│   └── log
├── pgsql
│   └── revok.pwfile
└── report
```

### Files to modify
* `activemq/conf/activemq.xml`: This contains the password and configuration used by the messaging queue server.
* `pgsql/revok.pwfile`: This contains the password used by the PostgreSQL server when the database user is initialized.
* `conf/revok.conf`: The global configuration used by revok modules.
* `httpd/conf.d/revok.conf`: Configration loaded by the Apache HTTPD server for the webconsole.

## Usage
The provided control script help with managing and running these docker files.

### Steps
1. Create a fresh runtime directory if one does not exist
```
cp -R ./runtime-template runtime
```
2. If using non-standard location for runtime directory, configure it via the environment variable:
```
export RT=/path/to/runtime
```
3. [Configure](#Configuration).
4. Run `revok-docker-ctl` script provided.
```
./revok-docker-ctl [build|pull|start|stop|restart|status]
```
