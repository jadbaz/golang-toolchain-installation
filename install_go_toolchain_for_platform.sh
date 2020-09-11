# Requirements
# - Install golang (yum, apt...)

# Installation
VERSION=1.15.2
GOOS=linux
GOARCH=arm
GOARM=5

## Download golang
cd /usr/local/src
wget https://golang.org/dl/go${VERSION}.src.tar.gz
tar -xzf go${VERSION}.src.tar.gz
cd go/src

## Cross-compile toolchain
time GOOS=$GOOS GOARCH=$GOARCH GOARM=$GOARM ./bootstrap.bash

## Package toolchain
cd /usr/local/src/
tar -czf go-linux-$GOARCH-bootstrap.tar.gz go-linux-$GOARCH-bootstrap

## Copy to target 
scp go-linux-$GOARCH-bootstrap.tar.gz user@IP:/usr/local/src

## On target
cd /usr/local/src
tar -xzf go-linux-$GOARCH-bootstrap.tar.gz
cp /usr/local/src/go-linux-$GOARCH-bootstrap/bin/* /usr/local/bin/
go version
