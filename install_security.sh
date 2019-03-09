#!/bin/bash

usage() {
  echo "Usage $0 -m <email>" 1>&2
} 

while getopts ":m:h" opt; do
  case $opt in
    m)
      echo "-m was triggered, Parameter: $OPTARG" >&2
      export EMAIL=$OPTARG
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

ansible-playbook -e "email=$EMAIL" install_security.yml
