#!/usr/bin/env bash

DATE=$(date +"%D-%T-%Z")
STATUS=$(git status -s 2> /dev/null)
CHANGES=$(($(echo $STATUS | grep " M" | wc -l | xargs) + $(echo $STATUS | grep "M " | wc -l | xargs) + $(echo $STATUS | grep " R" | wc -l | xargs) + $(echo $STATUS | grep "R " | wc -l | xargs) + $(echo $STATUS | grep " D" | wc -l | xargs) + $(echo $STATUS | grep "D " | wc -l | xargs) + $(echo $STATUS | grep "?? " | wc -l | xargs)))
IS_AHEAD=$(echo -n "$STATUS" | grep -i "ahead")

if [[ $CHANGES > 0 ]] || [[ ! -z "$IS_AHEAD" ]]
then
    git add -A
    git commit -m "$(date): Auto Git Push From Laptop"
    git push
    echo "$DATE PUSHED CHANGES" >> ./log_file.txt
else
    echo "$DATE NO CHANGES" >> ./log_file.txt
fi

