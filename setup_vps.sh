#!/bin/sh

# check for correct number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <user> <ip>"
  exit 1
fi

# set variables
USER=$1
IP=$2

# upload key for root
ssh-copy-id -i ~/.ssh/id_rsa.pub root@$IP

# install chef
bundle exec knife solo prepare root@$IP

# execute the run list
bundle exec knife solo cook root@$IP

# upload key for user
ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$IP

# restart nginx
ssh -t $USER@$IP 'sudo service nginx restart'
