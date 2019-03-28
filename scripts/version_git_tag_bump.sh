#!/bin/bash

branch=$(git rev-parse --abbrev-ref HEAD)
if [[ "$branch" != "master" ]]; then
  echo "Only run this script from branch master" >&2
  exit 1;
fi

current="false"
while getopts ":ch" option; do
  case "$option" in
    c)
      current="true"
      ;;
    h)
      echo "Usage: command [-hb] [-a <file>]"
      exit 0
      ;;
    :)
      echo "Option -$OPTARG requires an argument" >&2
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

find_latest_semver() {
  pattern="^$PREFIX([0-9]+\.[0-9]+\.[0-9]+)\$"
  versions=$(for tag in $(git tag); do
    [[ "$tag" =~ $pattern ]] && echo "${BASH_REMATCH[1]}"
  done)
  if [ -z "$versions" ]; then
    echo 0.0.0
  else
    echo "$versions" | tr '.' ' ' | sort -nr -k 1 -k 2 -k 3 | tr ' ' '.' | head -1
  fi
}

increment_ver() {
  find_latest_semver | awk -F. -v a="$1" -v b="$2" -v c="$3" \
    '{printf("%d.%d.%d", $1+a, $2+b , $3+c)}'
}

bump() {
  next_ver="${PREFIX}$(increment_ver "$1" "$2" "$3")"
  latest_ver="${PREFIX}$(find_latest_semver)"
  latest_commit=$(git rev-parse "${latest_ver}" 2>/dev/null)
  head_commit=$(git rev-parse HEAD)
  if [ "$latest_commit" = "$head_commit" ]; then
    echo "Current commit already tagged as $latest_ver"
    exit 1
  else
    if [[ "$force" == "true" ]]; then
      git tag "$next_ver"
    else
      echo "Dry run"
    fi
    echo "$next_ver"
  fi
}

if [[ "$current" == "true" ]]; then
  find_latest_semver
  exit 0
fi

force="false"
if [[ "$2" = "-f" ]]; then
  force="true"
fi

case $1 in
  major) bump 1 0 0 ;;
  minor) bump 0 1 0 ;;
  patch) bump 0 0 1 ;;
  *) find_latest_semver
esac
