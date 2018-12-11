#!/usr/bin/env bash

set -e

link=false
while getopts ":t:lh" option; do
  case "$option" in
    t)
      title="$OPTARG"
      ;;
    l)
      link=true
      ;;
    h)
      echo "Usage: jekyll_new_draft [-l] -a <file>]"
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

# Make all lowercase and replace hyphens with spaces

if [[ -z "$title" ]]; then
  echo "Missing title with the -t option" >&2
  exit 1
fi

slug=$(echo "$title" |
  tr -dc '[:alnum:]\r\n.\-/ ' |
  tr -s ' ' | tr '[A-Z]' '[a-z]' |
  tr ' ' '-')

drafts_directory=~/Development/Projects/Web/robenkleene.github.io/_drafts
if [[ ! -d "$drafts_directory" ]]; then
  echo "$drafts_directory is not a directory" >&2
  exit 1
fi

today=$(date +%Y-%m-%d)
post_path=$(mktemp "$drafts_directory/$today-XXXX")

[[ "$link" = true ]] && kind="link" || kind="post"

content="---
layout: $kind
title: \"$title\"
categories: 
---
"

echo "$content"

# echo "$content" >"$post_path"
# cat >>"$post_path"

# destination_post_path="$drafts_directory/$today-$slug.md"
# mv -n "$post_path" "$destination_post_path"
# if [[ -f "$post_path" ]]; then
#   echo -n $post_path
# else
#   echo -n $destination_post_path
# fi
