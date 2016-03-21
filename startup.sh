#!/bin/bash
gem install sinatra
if [ "$RACK_ENV" == "production" ]; 
then 
  bundle install --without development test
  ruby $MAIN_APP_FILE -p 80
else
  bundle install
  gem install shotgun
  if [ "$PATH_TO_SASS_FILES" != '' ];
  then
    sass -wc /usr/src/app/$PATH_TO_SASS_FILES &
  fi
  cd /usr/src/app && shotgun -o '0.0.0.0' -p 80
fi


