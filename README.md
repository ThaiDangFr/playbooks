# Ansible playbooks
## Guacamole installation

Modify /etc/ansible/hosts :
[production]
yourserver.com

[production:vars]
username=xxx
password=xxx


ansible-playbook  install_guacamole.yml
