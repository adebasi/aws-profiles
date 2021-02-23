#!/usr/bin/env bash

export="n"
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -e|--export) export="y"; ;;
        *) echo "Unknown parameter passed: $1"; return ;;
    esac
    shift
done

profile=$(cat ~/.aws/credentials | grep -o '\[[^]]*\]' | awk -F"[][]" '{print $2}' | sort -r | uniq | fzf)
if [[ -z $profile ]]; then
    return
fi
echo "Set aws profile: $profile"
export AWS_PROFILE="$profile"

if [[ "$export" = "y" ]]; then
  credentialsSection=$(grep -A 2 "\[${profile}\]" ~/.aws/credentials)
  credentialsFound=$?
  if [ ${credentialsFound} -ne 0 ]; then
    echo "No credentials found for profile '${profile}'."
    return
  fi
  accessKey=$(echo "${credentialsSection}" | grep "aws_access_key_id" | awk -F"aws_access_key_id = " '{print $2}')
  secretKey=$(echo "${credentialsSection}" | grep "aws_secret_access_key" | awk -F"aws_secret_access_key = " '{print $2}')
  export AWS_ACCESS_KEY_ID="${accessKey}"
  export AWS_SECRET_ACCESS_KEY="${secretKey}"
fi
