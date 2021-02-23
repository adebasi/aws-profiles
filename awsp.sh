#!/bin/bash

profile=$(cat ~/.aws/credentials | grep -o '\[[^]]*\]' | awk -F"[][]" '{print $2}' | sort -r | uniq | fzf)
if [[ -z $profile ]]; then
    return
fi
echo "Set aws profile: $profile"
export AWS_PROFILE="$profile"
