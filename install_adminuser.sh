#!/bin/bash

usage() {
  echo "Usage $0 -u <username> -p <password>" 1>&2
} 

while getopts ":u:p:h" opt; do
  case $opt in
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export AUSERNAME=$OPTARG
      ;;
    p)
      echo "-p was triggered, Parameter: $OPTARG" >&2
      export APASSWORD=$OPTARG
      ;;
    h)
      usage
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ $# -lt 1 ];then
    usage
    exit 1
fi

ansible-playbook -e "username=$AUSERNAME password=$APASSWORD" install_adminuser.yml
