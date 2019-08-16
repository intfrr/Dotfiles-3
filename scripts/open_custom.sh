#!/usr/bin/env bash

directory_extension() {
  path="$1"
  directory=${path##*/}
  extension="${directory##*.}"
  # If the directory is equal to the extension, that means the extension is
  # missing
  [[ $directory != "$extension" ]] && echo -n "$extension"
}

if [[ $# -eq 0 ]]; then
  # ~/.bin/finder_new
  extension=$(directory_extension "${PWD}")
  if [[ -z "$extension" ]]; then
    open .
  else
    # Reveal packages instead of opening them
    open -R .
  fi
else
  # This has been removed because it isn't compatiable with passing flags to
  # open
  # if [[ ! -e "$1" ]]; then
  #   touch "$1"
  # fi
  open "$@"
fi
