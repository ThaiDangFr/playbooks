#!/bin/bash -l

LOG_FILE=~/code/log/init-project.log
echo "$(date)">> $LOG_FILE 2>&1

export RAILS_ENV=production 

bundle install --deployment --without development test >> $LOG_FILE 2>&1
bundle exec rake assets:precompile db:migrate >> $LOG_FILE 2>&1
chmod 700 config db >> $LOG_FILE 2>&1
chmod 600 config/database.yml config/secrets.yml >> $LOG_FILE 2>&1
echo >> $LOG_FILE 2>&1
#bundle exec passenger-config restart-app .
