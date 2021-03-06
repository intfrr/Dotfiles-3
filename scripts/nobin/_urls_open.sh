#!/bin/sh

THEURLS="{"
while read LINE; do
  THEURLS=$THEURLS"\""${LINE}"\", "
done
THEURLS=${THEURLS%??}
THEURLS=$THEURLS"}"
echo $THEURLS

if [[ "$THEURLS" == "{}" ]]; then
  echo "No urls"
  exit 1
fi

# osascript <<-APPLESCRIPT
# set URLs to $THEURLS
# tell application "Brave Browser"
# 	activate
# 	open location {URL:item 1 of URLs}
#   repeat with theURL in rest of the URLs
#     open location theURL
#   end repeat
# end tell
# APPLESCRIPT

osascript <<-APPLESCRIPT
set URLs to $THEURLS
tell application "Safari"
	activate
	make new document with properties {URL:item 1 of URLs}
	tell window 1
		repeat with theURL in rest of the URLs
			make new tab with properties {URL:theURL}
		end repeat
	end tell
end tell
APPLESCRIPT
