#!/usr/bin/env bash

set -e

if [ "$#" -lt 1 ]; then
  echo "Wrong number of arguments" >&2
  exit 1
fi

if [[ -n "$2" ]]; then
  cd "$2"
fi

make_file() {
  name=$1
  directory=$2
  contents=$3
  mkdir -p "$directory"
  temp_path=$(mktemp "$directory/$name-XXXX")
  echo "$contents" >"$temp_path"
  destination_path="$directory/$name"
  mv -n "$temp_path" "$destination_path"
  if [[ -f "$temp_path" ]]; then
    echo -n "$temp_path"
  else
    echo -n "$destination_path"
  fi
}

title="$1"
contents="# $title"
slug=$(~/.bin/slug "$1")
readme_path=$(make_file "README.md" "$slug")
make_file "README.md" "$slug/archive" "$contents Archive"
echo "$readme_path"
