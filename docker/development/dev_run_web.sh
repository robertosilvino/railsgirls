#!/bin/bash

cd ..
docker-compose -f docker-compose.yml run --user "$(id -u)" web
cd util