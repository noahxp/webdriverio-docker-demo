#!/bin/bash

/opt/bin/entry_point.sh > /dev/null 2>&1 &

for number in {1..120}
do
	if curl http://localhost:4444; then
		break
	fi
  echo 'Waitting selenium service,' $number
	sleep 1
done

if ! curl http://localhost:4444; then
  exit 1
fi


cd /app
npm run docker