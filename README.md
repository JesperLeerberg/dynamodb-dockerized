# Dynamodb-dockerized

[![CircleCI](https://circleci.com/gh/leerberg/dynamodb-dockerized/tree/master.svg?style=shield)](https://circleci.com/gh/leerberg/dynamodb-dockerized/tree/master)

[![Docker Hub Badge](http://dockeri.co/image/leerberg/dynamodb)](https://registry.hub.docker.com/u/leerberg/dynamodb/)

Dynamodb in docker - with preload functionality

## Quick usage

##### Without data

```
docker run -it -p 8000:8000 leerberg/dynamodb
```

##### Usage with data

```
docker run -it --rm -p 8000:8000 -v $(pwd)/data:/opt/dynamodb/data leerberg/dynamodb
```

## Dockerfile - Why not use the offical ?

The offical [amazon dynamodb image](https://hub.docker.com/r/amazon/dynamodb-local/) is not very well documented and there is no link to the content of the Dockfile used. Based on the image size arround 201 MB is my assumption that it's based on a plain debian based java jdk image. This should be better and that's why I have created this image. Here are some of benifits of using this image.

- Image size = 100 MB (Debian slim) half of the original !
- Includes AWS cli (Great for debugging, with docker exec)
- Allows preload of data (By using docker volume and awscli)
- Dummy AWS cli credentials prepopulated

Check the contents of the [Dockerfile](Dockerfile) for futher details.

## Data

The preload data should be placed in a folder containing two json files ([batchData.json](/data/batchData.json) & [table.json](/data/table.json)). Both of the files contains the information needed by the AWS cli to create a table and write itmes. It's important to map the folder to the following path.

```
-v yourdatafolder:/opt/dynamodb/data
```

The entrypoint script will check if the data folder exsist and perform the aws cli commands needed. Inspect the [run.sh](run.sh) for futher details.

## AWS CLI dynamodb tips

Here are some great commands that you might find usefull. These can be run against the dockerimage from your own terminal using the [aws cli](https://aws.amazon.com/cli/).

```
# List tables
aws dynamodb list-tables --endpoint-url http://localhost:8000
# List items in a table
aws dynamodb scan --table-name Cowboys --endpoint-url http://localhost:8000
```

## Contributing

Please fell free to contribute by making pull requests. Ensure the readme is updated if changes are made.

### ToDo

- [ ] Craete template app using dynamodb as dependency and write an integration test
- [ ] Add tests to the build pipeline to setup quality gates
- [ ] Enable args being parsed to the DynamoDBLocal.jar file when the entrypoint is overwritten
