#!/bin/bash

usage() {
  echo "Usage $0 -u <username>" 1>&2
} 

while getopts ":u:h" opt; do
  case $opt in
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export AUSERNAME=$OPTARG
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


export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook -e "username=$AUSERNAME" uninstall_seedbox.yml
