#!/bin/bash

cd ..
sudo docker-compose -f docker-compose.yml up -d mysql
cd util