#!/bin/bash

# Check if the 'worldcup' database exists
if ! psql -U freecodecamp -lqt | cut -d \| -f 1 | grep -qw worldcup; then
  echo "Creating worldcup database..."
  createdb -U freecodecamp worldcup
  echo "Restoring database from db_backup.sql..."
  psql -U freecodecamp -d worldcup -f db_backup.sql
else
  echo "worldcup database already exists."
fi
