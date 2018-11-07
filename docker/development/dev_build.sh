#!/bin/bash

cd ..
docker-compose -f docker-compose.yml build web
cd util
