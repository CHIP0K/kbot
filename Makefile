APP=$(shell basename $(shell git remote get-url origin))
REGYSTRY=chip0k
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
# linux darwin windows
TARGETOS=linux
# arm64 amd64
TARGETARCH=amd64
ARCHITECTURE=$(shell dpkg --print-architecture)

format: # Переформатовує вихідний код go
	gofmt -s -w ./

lint:	# Виводить помилки стилю
	golint

test:
	go test -v

build: format
	go get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags="-X="github.com/CHIP0K/kbot/cmd.appVersion=${VERSION}

image:
	docker build -t ${REGYSTRY}/${APP}:${VERSION}-${TARGETARCH} .

push:
	docker push ${REGYSTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot