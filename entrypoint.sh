#!/bin/bash

[ -f /usr/bin/firefox ] && export SCRIPTS="docker-firefox"
[ -f /usr/bin/chromium ] && export SCRIPTS="docker-chrome"
[ -f /usr/bin/google-chrome ] && export SCRIPTS="docker-chrome"


uu=`uname -m`
echo 'uname -m:' $uu
if [ "$uu" = "arm64" ] || [ "$uu" = "aarch64" ];then
	export SCRIPTS="$SCRIPTS-arm64"
fi

/opt/bin/entry_point.sh > /dev/null 2>&1 &

for number in {1..120}
do
	if curl http://localhost:4444; then
		break
	fi
  echo "Waiting selenium service," $number
	sleep 1
done

if ! curl http://localhost:4444; then
  exit 1
fi


cd /app
echo "npm run $SCRIPTS"
npm run $SCRIPTS
