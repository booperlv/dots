#!/usr/bin/env bash
engine=$(ibus engine)
if [ "${engine}" == "xkb:us:colemak:eng" ] 
then
    ibus engine anthy 
else
    ibus engine xkb:us:colemak:eng
fi
