#!/bin/bash

docker-compose -f docker-compose.yml run web /bin/bash -c "./docker/setup_dev.sh && RAILS_ENV=test bundle exec rake test:all"