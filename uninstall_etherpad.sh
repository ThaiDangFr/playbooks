#!/bin/bash

usage() {
  echo "Usage $0" 1>&2
}

while getopts ":h" opt; do
  case $opt in
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

if [ $# -lt 0 ];then
    usage
    exit 1
fi

export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook -e "" uninstall_etherpad.yml
