#!/bin/bash

/bin/bash ./wait-for-it.sh mongodb:27017 -t 60 -- echo connected to mongodb!!

for i in ./testcases/*.js; do [ -f "$i" ] \
    && echo ================ Starting: benchrun.py -f "$i" ================ \
    && /usr/bin/python ./benchrun.py --host mongodb --port 27017 -u pabron -p passw0rd -f "$i" -t 1 2 4 --trialTime 10 --out /tmp/mongo-perf/logs/$(basename "$i").json \
    && echo ================ End: benchrun.py -f "$i" ================ \
;done
