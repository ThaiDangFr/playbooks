#!/bin/bash
ansible-playbook -e "username=$GUACUSR password=$GUACPWD" install_guacamole.yml
