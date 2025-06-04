#!/bin/bash

# Exit on error
set -e

echo "Setting up MariaDB database and user..."

# Check if the container is running
if ! docker-compose ps | grep -q "mariadb.*Up"; then
    echo "Error: MariaDB container is not running. Please start it with 'docker-compose up -d' first."
    exit 1
fi

# Run MySQL commands inside the container using the full path to mysql client
docker-compose exec -T mariadb /usr/bin/mariadb -uroot -prootpass123 <<-EOSQL
    -- Create database if it doesn't exist
    CREATE DATABASE IF NOT EXISTS parentpal;
    
    -- Create user if it doesn't exist and set password
    CREATE USER IF NOT EXISTS 'yulwan'@'%' IDENTIFIED BY 'loveyou';
    
    -- Grant all privileges on the database to the user
    GRANT ALL PRIVILEGES ON parentpal.* TO 'yulwan'@'%';
    
    -- Apply the changes
    FLUSH PRIVILEGES;
    
    -- Show the grants for the user (for verification)
    SHOW GRANTS FOR 'yulwan'@'%';
EOSQL

echo "Database and user setup completed successfully!"
