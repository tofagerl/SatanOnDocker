#!/bin/sh
for FILE in /work/keymaps/*.c; do
  FILENAME=${FILE#/work/keymaps/}
  NAME="${FILENAME%.c}"
  NEWFILENAME="/work/firmware/${NAME}.hex"
  KEYMAPFILENAME="/tmk/keyboard/gh60/keymap_${FILENAME}"
  echo "FILENAME: $FILENAME"
  echo "NAME: $NAME"
  echo "NEWFILENAME: $NEWFILENAME"
  echo "KEYMAPFILENAME: $KEYMAPFILENAME"
  cp "$FILE" "$KEYMAPFILENAME"
  cat "$KEYMAPFILENAME"
  cd /tmk/keyboard/gh60 && make "KEYMAP=$NAME" | ts >> "/work/logs/${NAME}-debug.log" 2>> "/work/logs/${NAME}-error.log"
  if test -f "$NEWFILENAME"; then
    mv "$NEWFILENAME" "${NEWFILENAME%.hex}-$(date +%Y.%m.%d-%H:%M:%S -r $NEWFILENAME).hex"
  fi
  cp "/tmk/keyboard/gh60/gh60_lufa.hex" "$NEWFILENAME"
  cd /tmk/keyboard/gh60 && make clean | ts >> "/work/logs/${NAME}-debug.log" 2>> "/work/logs/${NAME}-error.log"
  rm "$KEYMAPFILENAME"
done
