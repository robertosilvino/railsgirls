#!/bin/bash

cd ..
docker-compose -f docker-compose.staging_passenger.yml down
cd util