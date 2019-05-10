# Dynamodb-dockerized

[![CircleCI](https://circleci.com/gh/leerberg/dynamodb-dockerized/tree/master.svg?style=shield)](https://circleci.com/gh/leerberg/dynamodb-dockerized/tree/master)

[![Docker Hub Badge](http://dockeri.co/image/leerberg/dynamodb)](https://registry.hub.docker.com/u/leerberg/dynamodb/)

## WIP

Dynamodb in docker - with preload functionality

```
docker run -it -t -v \$(pwd)/data:/opt/dynamodb/data dyn /bin/sh

docker run -it -t -v \$(pwd)/data:/opt/dynamodb/data -p 8000:8000 dyn

aws dynamodb create-table --cli-input-json file://table.json --endpoint-url http://localhost:8000
aws dynamodb batch-write-item --request-items file:///batchData.json --endpoint-url http://localhost:8000
```

## test

```
aws dynamodb scan --table-name Cowboys --endpoint-url http://localhost:8000
```
