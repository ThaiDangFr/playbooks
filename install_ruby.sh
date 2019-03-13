#!/bin/bash

usage() {
  echo "Usage $0 -u <ruby user> -v <ruby version>" 1>&2
} 

while getopts ":u:v:h" opt; do
  case $opt in
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

ansible-playbook -e "username=$RUBYUSR ruby_version=$RUBYVERSION" install_ruby.yml
