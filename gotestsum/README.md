Usage:

Makefile:

```
sudo docker run --rm -t -v $(shell go env GOPATH):/go -v $(CURDIR):/work -w /work ghcr.io/hellt/gotestsum:v1.11.0
```
