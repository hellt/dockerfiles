# YANGLINT

A container image with yanglint and yanglib tools installed.

## Usage

To check a yang module located at $(pwd)/yang/awesome-app.yang

```bash
docker run --rm -it -v $(pwd):/work ghcr.io/hellt/yanglint yang/awesome-app.yang
```

If the schema is incorrect, the non-0 return code is returned.
