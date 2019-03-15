#!/bin/bash
export scriptpath=$(dirname $0)
cd ${scriptpath}/ansible
ansible-playbook install_postfix.yml
