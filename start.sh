#!/bin/sh
export TMK_DIR='/tmk/keyboard/gh60'
export DOCKER_NAME='satan'

# Build the image from Dockerfile
docker build -t "${DOCKER_NAME}_image" .
#
# Run the script which makes all the firmware
docker run -it --rm --env TMK_DIR="$TMK_DIR" -v "`pwd`:/work" "${DOCKER_NAME}_image" "$TMK_DIR/make.sh"
