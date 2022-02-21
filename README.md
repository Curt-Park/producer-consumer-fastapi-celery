# A producer-consumer example with FastAPI and Celery.
<img width="1860" alt="스크린샷 2022-02-21 오전 10 58 53" src="https://user-images.githubusercontent.com/14961526/154876820-52182eab-4295-42e5-960c-19ede6d5fff5.png">


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
$ export BROKER_URL=redis://redis-broker-ip:6379
$ export BACKEND_URL=redis://redis-backend-ip:6379
$ make worker
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

#### Docker's `network_mode=bridge`degrades the network performance.
We recommend to use Linux server if you would like to run `docker-compose up`.

## For Developers

```bash
$ make setup-dev      # setup for developers
$ make format         # format scripts
$ make lint           # lints scripts
$ make utest          # runs unit tests
$ make cov            # opens unit test coverage information
```
