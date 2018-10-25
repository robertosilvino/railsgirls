#!/bin/bash

./docker/change_owner_user.sh

##/bin/bash -l -c 'echo \"${APP_NAME}\" > .ruby-gemset'

# Recursive repository update
/bin/bash -l -c "git submodule update"
/bin/bash -l -c "git submodule --init --recursive"

/bin/bash -l -c "gem install bundler rake"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle config --global jobs $(($(getconf _NPROCESSORS_ONLN)*2))"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle install"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle install --with production --without test development"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle exec rake assets:clobber"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle exec rake tmp:clear"

/bin/bash -l -c "RAILS_ENV=${RAILS_ENV} bundle exec rake assets:precompile"
##./docker/change_owner_user.sh

/bin/sh -c "./docker/start_db.sh"
##vim
##su -c "/bin/bash -l -c 'RAILS_ENV=${RAILS_ENV} bundle config --global'" app