#!/bin/bash

usage() {
  echo "Usage $0 -u <ruby user> -v <ruby version> [-g <github project>]" 1>&2
} 

while getopts ":g:u:v:h" opt; do
  case $opt in
    g)
      echo "-g was triggered, Parameter: $OPTARG" >&2
      export GITHUB=$OPTARG
      ;;
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export RUBYUSR=$OPTARG
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

if [ $# -lt 2 ];then
    usage
    exit 1
fi

export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook -e "username=$RUBYUSR ruby_version=$RUBYVERSION github=$GITHUB" install_ruby.yml
