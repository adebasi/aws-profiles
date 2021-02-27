# AWS Profile switcher

Just another profile switcher. It uses `fzf` to easily pick a profile. 

The parameter `-e` allows you to export `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
This can be helpful when using aws-cli in docker. 
```
$ docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY amazon/aws-cli s3 ls
```

The script uses the aws credentials file (`~/.aws/credentials`) to list all available profiles and export credentials to your environment when specifying `-e`.

## Install 

Clone this repository:

`$ git clone git@github.com:adebasi/aws-profiles.git`

Create an alias in your profile - here it uses Z shell: 

`$ echo "alias awsp=\"source $(pwd)/aws-profiles/awsp.sh\"" >> ~/.zshrc`

Source the file to directly use the alias.

`$ source ~/.zshrc`

You are ready to go now

## Usage

`awsp`

