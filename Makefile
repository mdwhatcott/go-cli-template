#!/usr/bin/make -f

VERSION := $(shell git describe)

test: fmt
	go version && go test -race -cover -timeout=1s -count=1 ./...

fmt:
	go mod tidy && go fmt ./...

install: test
	go install -ldflags="-X 'main.Version=$(VERSION)'" github.com/mdwhatcott/cli-template/cmd/...
