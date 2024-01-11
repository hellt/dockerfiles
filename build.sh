set -eu

NAME=$1
VERSION=$2

cd $NAME
docker build -f *.dockerfile . --build-arg VERSION=$2 -t ghcr.io/hellt/$NAME:$2
docker push ghcr.io/hellt/$NAME:$2
