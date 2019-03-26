#!/bin/bash

usage() {
  echo "Usage $0 -u <admin username> -p <admin password> -s <server name>" 1>&2
}

while getopts ":u:p:s:h" opt; do
  case $opt in
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export AUSERNAME=$OPTARG
      ;;
    p)
      echo "-p was triggered, Parameter: $OPTARG" >&2
      export APASSWORD=$OPTARG
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

if [ $# -lt 1 ];then
    usage
    exit 1
fi

export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook -e "username=$AUSERNAME password=$APASSWORD server_name=$SERVERNAME" install_etherpad.yml
