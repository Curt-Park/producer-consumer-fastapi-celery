## Preparation
```bash
$ docker-compose up
```

## How to play

#### How to Run 1: In WebBrowser
http://0.0.0.0:8000/produce

#### How to Run 2: test client
Sending a number of requests simultaneously.

Test Run:
```bash
$ python client.py --n-req [N_REQUSTS]
```

## Experimental Results (Single Machine)

#### Initial Execution Time (w/ warmup)
`Spent 16.263172149658203 Sec`

#### Best Execution Time (after warmup)
`Spent 2.18007493019104 Sec`

## Experimental Results (Additional Worker)

More Preparation:

```bash
# In the additional worker Server
$ export BROKER_URL=redis://api-server-ip:6379
$ export BACKEND_URL=redis://api-server-ip:6379
$ make workers
```

#### Initial Execution Time (w/ warmup)
`Spent 16.380640029907227 Sec`

#### Best Execution Time (after warmup)
`Spent 2.186844825744629 Sec`

## Issue Handling

#### Redis Error 8 connecting localhost:6379. nodename nor servname provided, or not known.
`$ ulimit -n 1024`
