#!/bin/bash

usage() {
  echo "Usage $0 -u <rails user> -g <github url> -s <server name>" 1>&2
} 

while getopts ":u:g:h" opt; do
  case $opt in
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export RAILSUSR=$OPTARG
      ;;
    g)
      echo "-g was triggered, Parameter: $OPTARG" >&2
      export GITHUB=$OPTARG
      ;;
    s)
      echo "-s was triggered, Parameter: $OPTARG" >&2
      export SERVERNAME=$OPTARG
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

if [ $# -lt 6 ];then
    usage
    exit 1
fi

export PROJECT=$(basename $GITHUB .git)

ansible-playbook -e "username=$RAILSUSR github=$GITHUB project=$PROJECT servername=$SERVERNAME" install_rails.yml
