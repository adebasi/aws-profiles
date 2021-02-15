#!/bin/bash

profile=$(cat ~/.aws/credentials | grep -o '\[[^]]*\]' | awk -F"[][]" '{print $2}' | sort -r | uniq | fzf)
if [[ -z $profile ]]; then
    exit 0
else
    echo "Set aws profile: $profile"
    export AWS_PROFILE="$profile"
fi
