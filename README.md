# A producer-consumer example with FastAPI and Celery.

## How to play

#### Server (Option 1 - On your Local)
Install [Redis](https://redis.io/topics/quickstart), and run the following commands:

```bash
$ make env        # create a conda environment (need only once)
$ conda activate producer-consumer-fastapi-celery  # activate the env
$ make setup      # setup packages (need only once)
$
$ make broker     # run redis broker
$ make worker     # run celery worker
$ make api        # run fastapi server
$ make dashboard  # run dashboard that monitors celery
```

#### Server (Option 2 - Docker Compose)
Install [Docker](https://docs.docker.com/engine/install/) & [Docker Compose](https://docs.docker.com/compose/install/),
and run the following command:

```bash
$ docker-compose up
```

#### [Optional] Additional Workers
You can start up additional workers on other devices.

```bash
$ export BROKER_URL=redis://api-server-ip:6379
$ export BACKEND_URL=redis://api-server-ip:6379
$ make workers
```

#### Client

#### Option 1: In WebBrowser
http://0.0.0.0:8000/produce

#### Option 2: Test Client
Sending a number of requests simultaneously.

```bash
$ python client.py --n-req [N_REQUSTS]
```

#### Dashboard for Celery (Flower)
http://0.0.0.0:5555/

## Issue Handling

#### Redis Error 8 connecting localhost:6379. nodename nor servname provided, or not known.
`$ ulimit -n 1024`
