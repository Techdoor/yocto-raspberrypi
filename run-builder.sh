#!/bin/sh -x
mkdir -p dist
docker run --rm=true -v $(pwd)/builder.sh:/builder.sh -v $(pwd)/dist:/dist mkilivan/yocto-build /builder.sh
