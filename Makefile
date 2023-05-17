APP=$(shell basename $(shell git remote get-url origin))
REGYSTRY=chip0k
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
# linux darwin windows
TARGETOS=linux
# arm64 amd64
TARGETARCH=amd64
#ARCHITECTURE=$(shell dpkg --print-architecture)

help:
	@echo "Avaliable commands:"
	@echo "make format			Formatter source code"
	@echo "make lint			Go linter, show syntax errors"
	@echo "make test			To Testing in Go"
	@echo "make build			To build application with default parameters, TARGETOS=linux and TARGETARCH=amd64"
	@echo "make linux			To build application for linux OS"
	@echo "make darwin			To build application for MacOS"
	@echo "make windows			To build application for Windows OS"
	@echo "make image 			To build docker application"
	@echo "make push 			Push docker image in docker registry"
	@echo "make clean			Remove all local artifacts"
	@echo "make <command> TARGETARCH=arm64	Build application for ARM architecture"


format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

# build 
linux:
	${MAKE} build TARGETOS=linux TARGETARCH=${TARGETARCH}

darwin:
	${MAKE} build TARGETOS=darwin TARGETARCH=${TARGETARCH}

windows:
	${MAKE} build TARGETOS=windows TARGETARCH=${TARGETARCH}

build: format
	go get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags="-X="github.com/CHIP0K/kbot/cmd.appVersion=${VERSION}

image:
	docker build -t ${REGYSTRY}/${APP}:${VERSION}-${TARGETARCH} --build-arg TARGETARCH=${TARGETARCH}  --build-arg TARGETOS=${TARGETOS} .

push:
	docker push ${REGYSTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	@echo=off docker rmi ${REGYSTRY}/${APP}:${VERSION}-${TARGETARCH} 2> /dev/null || true
	@echo=off rm -rf kbot || true