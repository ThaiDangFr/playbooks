#!/bin/bash

usage() {
  echo "Usage $0 -u <username> [-b : to clean binaries]" 1>&2
} 

while getopts "u:hb" opt; do
  case $opt in
    b)
      echo "-b was triggered" >&2
      export CLEANBINARIES="yes"
      ;;
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export USERNAME=$OPTARG
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

export DEVUSR=${USER}

export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook -e "devusr=$DEVUSR username=$USERNAME clean_binaries=$CLEANBINARIES" uninstall_rails4dev.yml
