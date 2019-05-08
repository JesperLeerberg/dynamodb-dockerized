# Local dynamodb info can be found here http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html 
FROM openjdk:8-slim-stretch

LABEL maintainer="Jesper Leerberg Madsen <jesper.leerberg@gmail.com>"

RUN mkdir -p opt/dynamodb
WORKDIR /opt/dynamodb

# Install wget & awscli
RUN  apt-get update \
  && apt-get install -y wget awscli \
  && rm -rf /var/lib/apt/lists/*

# Download the dynamo jar 
RUN wget https://s3.eu-central-1.amazonaws.com/dynamodb-local-frankfurt/dynamodb_local_latest.tar.gz -q -O - | tar -xz

# Copy run script
COPY run.sh .
# Use dummy aws credentials and config
COPY aws /root

# Expose port 8000 to allow access via http://localhost:8000/shell/
EXPOSE 8000
CMD ["./run.sh"]