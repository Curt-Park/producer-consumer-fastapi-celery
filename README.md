# A producer-consumer example with FastAPI and Celery.
<img width="841" alt="스크린샷 2022-02-20 오후 11 58 50" src="https://user-images.githubusercontent.com/14961526/154848846-86a855c6-4ccf-4e6f-9ff2-d630519342d7.png">


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
$ python src/client.py --n-req [N_REQUSTS]
```

#### Dashboard for Celery (Flower)
http://0.0.0.0:5555/
![image](https://user-images.githubusercontent.com/14961526/154842930-70c54154-cf94-4368-bd46-fa43bd232d35.png)


## Issue Handling

#### Redis Error 8 connecting localhost:6379. nodename nor servname provided, or not known.
`$ ulimit -n 1024`
