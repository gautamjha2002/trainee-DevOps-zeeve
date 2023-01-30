#!/bin/bash

# Stop a service
sudo systemctl stop mysql

# Create a snapshot of data
sudo tar -czvf /var/lib/mysql/data.tar.gz /var/lib/mysql

# again start mysql service
sudo systemctl start mysql

# Push the snapshot to S3
sudo aws s3 cp /var/lib/mysql/data.tar.gz s3://zeevegautams3/mysqldata.tar.gz

