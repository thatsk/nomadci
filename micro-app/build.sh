#!/bin/bash

set -e

cd ${0%/*}

# Retrieve dependencies
go get -d -v

# Run tests
go test -v

# Build binaries
CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o micro-app main.go

# Package in Docker container
docker build -t thatsk/micro-app .

docker push thatsk/micro-app
