#!/bin/bash

usage() {
  echo "Usage $0 -u <username> -p <password> -t <http port> -e <peer port> -b <bind ip>" 1>&2
} 

BIND_IP="0.0.0.0"

while getopts ":b:u:p:ht:e:" opt; do
  case $opt in
    b)
      echo "-b was triggered, Parameter: $OPTARG" >&2
      export BIND_IP=$OPTARG
      ;;
    u)
      echo "-u was triggered, Parameter: $OPTARG" >&2
      export AUSERNAME=$OPTARG
      ;;
    p)
      echo "-p was triggered, Parameter: $OPTARG" >&2
      export APASSWORD=$OPTARG
      ;;
    t)
      echo "-t was triggered, Parameter: $OPTARG" >&2
      export HTTP_PORT=$OPTARG
      ;;
    e)
      echo "-e was triggered, Parameter: $OPTARG" >&2
      export PEER_PORT=$OPTARG
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
ansible-playbook -e "username=$AUSERNAME password=$APASSWORD http_port=$HTTP_PORT peer_port=$PEER_PORT bind_ip=$BIND_IP" install_seedbox.yml
