#!/bin/bash

./docker/change_owner_user.sh

##/bin/bash -l -c 'echo \"${APP_NAME}\" > .ruby-gemset'

# Recursive repository update
/bin/bash -l -c "git submodule update"
/bin/bash -l -c "git submodule --init --recursive"

/bin/bash -l -c "gem install bundler"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle config --global jobs $(($(getconf _NPROCESSORS_ONLN)*2))"

if [ "${ENV}" == "development" ]; then \
  /bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle install --without production --with test development"
elif [ "${ENV}" == "production" ]; then \
  /bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle install --with production --without test development"
  #/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle exec rake assets:clobber"
  #/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle exec rake tmp:clear"
  /bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle exec rake assets:precompile"
else #"${ENV}" == test
  /bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle install --with production test --without development"
fi

/bin/sh -c "./docker/start_db.sh"
##vim
