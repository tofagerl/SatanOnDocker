#!/bin/sh
if [ -d /work/firmware ]; then
  mv /work/firmware "/work/firmware-`date +%Y%m%d%H%M%S`"
fi
mkdir /work/firmware
for FILE in /work/keymaps/*.c; do
  FILENAME=${FILE#/work/keymaps/}
  NAME=${FILENAME%.c}
  cp $FILE keymap_${FILENAME}
  echo FILE: $FILE
  echo FILENAME: $FILENAME
  echo NAME: $NAME
  cd "$TMK_DIR" || exit
  echo "`pwd`"
  make KEYMAP=$NAME
  cp $TMK_DIR/gh60_lufa.hex /work/firmware/${NAME}.hex
  make clean
  rm keymap_${FILENAME}
done
