#!/bin/bash

usage() {
  echo "Usage $0 -g <github url> -v <ruby version>" 1>&2
} 

while getopts ":g:v:h" opt; do
  case $opt in
    g)
      echo "-g was triggered, Parameter: $OPTARG" >&2
      export GITHUB=$OPTARG
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

if [ $# -lt 4 ];then
    usage
    exit 1
fi

export RAILSUSR=$(basename $GITHUB .git | awk '{print tolower($0)}')
export DEVUSR=${USER}

export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook -e "devusr=$DEVUSR username=$RAILSUSR github=$GITHUB ruby_version=$RUBYVERSION" install_rails4dev.yml
