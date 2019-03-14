#!/bin/bash

usage() {
  echo "Usage $0 -g <github url> -s <server name> -v <ruby version>" 1>&2
} 

while getopts ":g:s:v:h" opt; do
  case $opt in
    g)
      echo "-g was triggered, Parameter: $OPTARG" >&2
      export GITHUB=$OPTARG
      ;;
    s)
      echo "-s was triggered, Parameter: $OPTARG" >&2
      export SERVERNAME=$OPTARG
      ;;
    v)
      echo "-v was triggered, Parameter: $OPTARG" >&2
      export RUBYVERSION=$OPTARG
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

export PROJECT=$(basename $GITHUB .git | awk '{print tolower($0)}')
export RAILSUSR=$PROJECT

ansible-playbook -e "username=$RAILSUSR github=$GITHUB project=$PROJECT server_name=$SERVERNAME ruby_version=$RUBYVERSION" install_rails.yml
