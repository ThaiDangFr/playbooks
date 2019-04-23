#!/bin/bash -l
LOG_FILE=./log/init-project.log
echo "$(date)">> $LOG_FILE 2>&1

export RAILS_ENV=development 

bundle install >> $LOG_FILE 2>&1
bundle exec rake db:migrate >> $LOG_FILE 2>&1
chmod 700 config db >> $LOG_FILE 2>&1
chmod 600 config/database.yml config/secrets.yml >> $LOG_FILE 2>&1
echo >> $LOG_FILE 2>&1
