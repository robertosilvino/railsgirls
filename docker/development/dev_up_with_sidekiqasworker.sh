#!/bin/bash

cd ..
export DOCKERGID=$(cut -d: -f3 < <(getent group docker))
sudo docker-compose -f docker-compose.development.sidekiqworker.yml up web worker
cd util