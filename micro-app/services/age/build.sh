#!/bin/bash

set -e

cd ${0%/*}

go get -d -v

go test

CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o age-service main.go

docker build -t thatsk/age-service .

docker push thatsk/age-service
