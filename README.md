# Ansible playbooks
```
Modify /etc/ansible/hosts :
[production]
yourserver.com

system installation:
./install_postfix
./install_adminuser.sh -u <username> -p <password>
./install_guacamole.sh -u <username> -p <password>
./install_security.sh -m <email>

ruby installation:
./install_ruby.sh -u <ruby user> -v <ruby version> [-g <github project]

rails installation:
./install_rails.sh -g <github url> -s <server name> -v <ruby version>

seedbox installation:
./install_seedbox.sh -u <username> -p <password> -t <http port> -e <peer port>

etherpad installation:
./install_etherpad.sh -u <admin username> -p <admin password> -s <server name>
```