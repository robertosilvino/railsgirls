#!/bin/bash

./docker/setup_dev.sh && RAILS_ENV=test bundle exec rake test:all