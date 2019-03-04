# Ansible playbooks
## Guacamole installation
```
Modify /etc/ansible/hosts :
[production]
yourserver.com

vi ~/.bashrc
export GUACUSR=xxx
export GUACPWD=xxx

launch:
./install_guacamole.sh
```
## Postfix installation
```
launch:
./install_postfix.sh
```
