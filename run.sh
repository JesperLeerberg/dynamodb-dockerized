#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
java -jar /opt/dynamodb/DynamoDBLocal.jar -sharedDb &

# Start the helper process
if [ -d "/opt/dynamodb/data" ]; then
  echo "*************************************************************************"
  echo "Data found. Preparing database using the awscli"
  echo "*************************************************************************"
  sleep 2
  aws dynamodb create-table --cli-input-json file:///opt/dynamodb/data/table.json --endpoint-url http://localhost:8000
  aws dynamodb batch-write-item --request-items file:///opt/dynamodb/data/batchData.json --endpoint-url http://localhost:8000
else
  echo "*************************************************************************"
  echo "No datafolder found at path /opt/dynamodb/data. Starting a clean DynamoDB"
  echo "*************************************************************************"
fi

# now we bring the primary process back into the foreground
# and leave it there
fg %1
