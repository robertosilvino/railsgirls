#!/bin/bash

cd ..
docker-compose -f docker-compose.staging_passenger.yml up web_passenger
cd util