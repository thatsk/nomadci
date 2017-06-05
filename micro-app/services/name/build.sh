#!/bin/bash

set -e

cd ${0%/*}

go get

go test

CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o name-service main.go

docker build -t thatsk/name-service .

docker push thatsk/name-service
