#!/bin/bash

cd ..
docker-compose -f docker-compose.staging_passenger.yml build web_passenger
cd util
