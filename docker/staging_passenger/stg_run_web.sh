#!/bin/bash

cd ..
docker-compose -f docker-compose.staging_passenger.yml run --user "app" -p 3002:3000 web_passenger
cd util